%% fig:daphpop
%% bib:Kooy85a
%% out:daphpop

%% 6 fed-batch cultures of Daphnia magna at different feeding levels

%% in period 0 till 24 d:
intake = [240 120 60 30 12 6]'; %% 10^6 cells Chlorella per day
%% after day 24 all cultures received 30 10^6 cells/d

%% first column: time in days

tN = [ 0    6    6    6    6    6    6;
       8    6    6    6    6    6    6;
      11   89   27   50   41   19   14;
      15  192  116  115   70   29   17;
      18  269  219  130   73   32   17;
      21  381  271  135   74   33   19;
      24  410  277  134   73   32   20;
      28  295  126  127   70   30   20;
      30  180  111  117   73   29   20;
      32  145   97  113   72   28   24;
      35   92   81  103   72   29   34;
      37   71   64   78   57   28   42];
tN1 = tN(1:7,:);  % food regime different
tN2 = tN(7:12,:); % food regime equal
diag = [0 0;  215 500]; % line through carrying capacities

%% gset output "daphpop.ps"

hold on
plot(tN1(:,1), tN1(:,2), '-r+', ...
     tN1(:,1), tN1(:,3), '-g+', ...
     tN1(:,1), tN1(:,4), '-b+', ...
     tN1(:,1), tN1(:,5), '-m+', ...
     tN1(:,1), tN1(:,6), '-c+', ...
     tN1(:,1), tN1(:,7), '-y+')
 plot([24 24], [500 0], ':k', ...
     tN2(:,1), tN2(:,2), 'r+', ...
     tN2(:,1), tN2(:,3), 'g+', ...
     tN2(:,1), tN2(:,4), 'b+', ...
     tN2(:,1), tN2(:,5), 'm+', ...
     tN2(:,1), tN2(:,6), 'c+', ...
     tN2(:,1), tN2(:,7), 'y+', ...
     tN2(:,1), tN2(:,2), '-m', ...
     tN2(:,1), tN2(:,3), '-m', ...
     tN2(:,1), tN2(:,4), '-m', ...
     tN2(:,1), tN2(:,5), '-m', ...
     tN2(:,1), tN2(:,6), '-m', ...
     tN2(:,1), tN2(:,7), '-m')
legend('240', '120', '60', '30', '12', '6', 2)
xlabel('time, d')
ylabel('% of daphnids')