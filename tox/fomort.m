function f = fomort (p, t, c)
  %% f = fomort (p, t, c)
  %% created 2004/04/06 by Bas Kooijman
  %% standard effects on survival: first-order-mortality
  %%  first order toxico kinetics
  %%  hazard rate linear in the internal conc
  %% p: (4,1) matrix with parameters values in p(:,1) (see below)
  %% t: (nt,1) matrix with exposure times
  %% c: (nc,1) matrix with concentrations of toxic compound
  %% f: (nt,nc) matrix with survival probabilities

  %% application is illustrated in script-file mydata_fomort
  
  %% unpack parameters for easy reference
  h = p(1);  % 1/h, blank mortality prob rate (always >0)
  c0 = p(2); % mM, No-Effect-Concentration (external, may be zero)
  b = p(3);  % 1/(h*mM), killing rate
  k = p(4);  % 1/h, elimination rate

  t0 = -log(max(1e-8,1-c0./max(1e-8,c')))/k; % no-effect-time
  c1 = ones(1,max(size(c))); % row-matrix of ones
  t1 = ones(max(size(t)),1); % column-matrix of ones
  f = (b/k)*max(0,t1*e.^(-k*t0) - e.^(-k*t)*c1).*(t1*c') - ...
      b*(t1*(max(0,c-c0)')).*max(0,t*c1 - t1*t0);
  f = min(1,e.^f).* (e.^(-h*t)*c1);
  
