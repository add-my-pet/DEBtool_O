function [r_out, jEM, jVM, jER, info] = ...
      sgr4 (m_E, k_E, j_EM, y_EV, j_VM, a, r0)
  %% [r_out, jEM, jVM, jER, info] = sgr4 (m_E, k_E, j_EM, y_EV, j_VM, a, r0)
  %% specific growth rate for V1 morph with 4 reserves, allowing for shrinking
  %% created: 2007/09/26 by Bas Kooijman, modified 2008/06/09
  %% m_E:  4-vector with mol/mol, reserve density
  %% k_E:  4-vector with 1/time, reserve turnover rate
  %% j_EM: 4-vector with mol/time.mol, spec maintenance flux if from reserve
  %% y_EV: 4-vector with mol/mol, yield of reserve on structure
  %% j_VM: optional 4-vector with mol/time.mol, spec maintenance flux
  %%       if from structure (default j_EM/ y_EV)
  %% a: optional 1 or 4-vector with preference (default 0)
  %% r0: optional scalar with initial estimate for r (default 0)
  %% r:   scalar with 1/time, spec growth rate
  %% jEM: 4-vector with mol/time.mol, spec maintenance flux for reserve
  %% jVM: 4-vector with mol/time.mol, spec maintenance flux for structure
  %% jER: 4-vector with mol/time.mol, rejected flux of reserve
  %% info: scalar with numerical failure (0) or success (1)

  persistent r
  
  if exist('j_VM', 'var') == 0
    j_VM = j_EM ./ y_EV; % minimum value
  end
  if isempty(j_VM)
    j_VM = j_EM ./ y_EV; % minimum value
  end
  if exist('a', 'var') == 0
    a = [0; 0; 0; 0]; % switch model: absolute priority of reserve for maintenance
  end
  if isempty(a)
    a = [0; 0; 0; 0]; % switch model: absolute priority of reserve for maintenance
  end
  if length(a) == 1
    a = [a; a; a; a];
  end
  if exist('r0', 'var') == 1 % use initial guess if specified
    r = r0;  % initiate spec growth rate
  end
  if isempty(r) % if first call is without r_0
    r = 0;
  end

  M = m_E ./ y_EV; sM = sum(M); % help quantities
  i = 0; n = 50; info = 1; % initiate iteration pars
  f = 1; % initiate norm; make sure that iteration procedure is started
  j_EC = [0;0;0;0]; jEM = [0;0;0;0]; jVM = [0;0;0;0];  % initiate vars

  while (f^2 > 1e-15) && (i < n) % test norm
    for j = 1:4 % obtain jEM jVM jER given r
      j_EC(j) = m_E(j) * (k_E(j) - r); % catabolic rate
      if a(j) == 0 % switch model
        jEM(j) = max(1e-6, min(j_EM(j), j_EC(j)));
        jVM(j) = j_VM(j) * (1 - jEM(j)/ j_EM(j));
      else % preference model
        C = - j_EC(j) * (j_EC(j) + y_EV(j) * j_VM(j));
        B = C + ((1 - a(j)) * j_EC(j) + y_EV(j) * j_VM(j)) * j_EM(j);
        A = a(j) * j_EM(j)^2;
        jVM(j) = j_VM(j) * 2 * A/ (2 * A + sqrt(B^2 - 4 * A * C) - B);
        jEM(j) = j_EM(j) * (1 - jVM(j)/ j_VM(j));
      end
    end
    R = max(1e-6, (j_EC - jEM) ./ y_EV); % compounding rates
    sR = sum(R);
    s = sum(1 ./ R) - sum(1 ./ (R([1 1 1 2 2 3]) + R([2 3 4 3 4 4]))) + ...
	sum(1 ./ (R([1 1 1 2]) + R([2 2 3 3]) + R([3 4 4 4]))) - 1/ sR; 
    f = r + sum(jVM) - 1/s; % norm
    df = 1 + (sum(M ./ R .^2) - sM/ sR^2)/ s^2; % d/dr f
    r = r - f/ df; % new step in NR-procedure
    i = i + 1;
  end

  if i == n
    info = 0;  % no convergence
    printf(['no convergence of sgr4 in ', num2str(n), ' steps\n']);
  end

  jER = (k_E - r) .* m_E - jEM - y_EV * (r + sum(jVM));
  r_out = r;
