%% fig:penguin
%% bib:Ston53,Tayl62
%% out:ston53,tayl62
%% weight^1/3 (g^1/3) at age (d) at abundant and varying food supply

%% Aptenodytes forsteri at varying food
%% bib:Ston53
tL_Af = [0          7.320385116;
	10.44125662 10.09706669;
	22.56117196 10.24946486;
	31.97297809 9.851275075;
	32.55990937 10.27370655;
	33.72753846 10.13901007;
	34.47573882 10.88323232;
	35.55287222 11.10612714;
	37.50520797 11.14636965;
	38.63701035 11.28090604;
	39.89929079 11.44165788;
	41.76386871 11.25262564;
	45.81694142 11.53137741;
	48.77014191 11.67552929;
	52.40144898 11.58447096;
	59.78171236 12.53171671;
	63.96044744 13.09703016;
	71.69170308 13.73470393;
	74.87027254 14.50939311;
	77.66681917 14.98920543;
	83.00698896 15.66693392;
	85.58212179 17.08704599;
	90.07006758 18.16800539;
	90.92049238 18.97379916;
	92.87490595 19.34056148;
	94.90327081 19.19091591;
	98.3328864 19.00318397;
	102.0560874 19.18110454;
	105.2948407 19.92037415;
	108.0093838 20.53272411;
	110.7680259 20.95524948;
	113.3031568 21.37821932;
	113.9916134 21.54893722;
	115.1431772 21.87317121;
	116.9310464 22.17407743;
	119.6777398 22.48190193;
	123.268864 22.92483429;
	125.9507583 22.61062716;
	130.2292 23.51991623;
	132.4808365 23.06095266;
	136.0583937 23.06707591;
	137.0817577 22.77381682;
	142.0458595 22.6006834;
	145.1139127 22.62105728;
	152.4121336 22.47416971;
	156.4362535 22.47499245;
	157.3569531 22.72908575;
	161.4176184 23.38729619;
	163.526608 23.09187827;
	168.1089656 24.15941247;
	172.3570563 24.16420231];

%% Pygoscelis adeliae at abundant food
%% bib:Tayl62

tL_Pa =  [0.1050009894 4.358478567;
	  0.9777957315 4.917912364;
	  2.118730872 5.210194087;
	  3.063815425 5.511451325;
	  4.302110794 6.249474384;
	  5.268179168 6.805891153;
	  6.219949486 6.816766935;
	  7.038500159 7.56690009;
	  8.123829032 7.90029505;
	  9.192821588 8.488883129;
	  10.1383335 8.837069346;
	  11.43798606 9.14094057;
	  12.09870074 9.976275244;
	  13.24971378 10.35067428;
	  14.06955484 10.21794762;
	  15.23978887 10.65392415;
	  16.27753273 10.88470396;
	  17.26747789 10.98940411;
	  18.20555616 11.54584607;
	  19.13609396 12.29881152;
	  20.39399255 12.11582818;
	  21.19102521 12.55214058;
	  22.08521274 12.38708307;
	  23.27619019 13.05182158;
	  24.1271464 13.26223789;
	  25.2937746 13.30225116;
	  26.35431855 13.98763865;
	  27.38583902 13.53501519;
	  28.13731661 14.09162508;
	  29.22037515 14.17570984;
	  30.11627211 14.19836825;
	  31.34232607 14.61669603;
	  32.18510077 14.95324237;
	  33.23570867 14.5475311;
	  34.10668715 14.90751673;
	  35.15640531 15.4286612;
	  36.42901093 14.811568;
	  37.26747703 15.69953824;
	  38.38844332 15.84811675;
	  38.91889307 15.69805202;
	  40.31246029 16.06929969;
	  41.0006659 15.82523425;
	  42.49250981 15.71830058;
	  43.48381717 15.97258685;
	  44.42350635 15.68136573;
	  45.29007771 15.55739626;
	  46.19669361 15.73256546;
	  47.34418096 15.71980042;
	  48.32193815 15.51067142;
	  49.43956572 15.29261729;
	  50.38246007 15.35336351];
%% exclude last 9 data points from fit
tL_Pa = [tL_Pa, [ones(42,1);zeros(9,1)]];

p = [4 17 .05]';
nmregr_options('report',0);
p = nmregr('bert', p, tL_Pa);
[cov cor sd] = pregr('bert', p, tL_Pa);
par_txt = ['birth length'; 'ultimate length'; 'von Bert g rate'];
printpar(par_txt, p, sd);
nmregr_options('report',1);

t_Pa = linspace(0,52,100)';
L_Pa = bert(p(:,1), t_Pa);

k_Af = knot(10 * (0:18)', tL_Af);
t_Af = linspace(0, 180, 100)';
[L_Af dL_Af] = spline(t_Af, k_Af);

p = [.3, .7, .1, .6, .01, 18.17, .6]'; % see function intake 
tf_Af = intake(p, [t_Af, L_Af, dL_Af]);

subplot(1,2,1);
plot(tL_Pa(:,1), tL_Pa(:,2), '.g', t_Pa, L_Pa, '-r')
xlabel('age, d')
ylabel('weight^(1/3), g^(1/3)')

subplot(1,2,2); hold on;
[AX, H1, H2] = plotyy(t_Af, L_Af, tf_Af(:,1), tf_Af(:,2)); 
set(get(AX(1), 'Ylabel'), 'String', 'weight^(1/3), g^(1/3)')
set(get(AX(2), 'Ylabel'), 'String', 'scaled food intake, cm^2')
set(H1, 'LineStyle', '-'); set(H1, 'Color', 'r');
set(H2, 'LineStyle', '-'); set(H2, 'Color', 'g');
x = [0; 0]; plot([0;0], [0; 1e-4], '-g', tL_Af(:,1), tL_Af(:,2), '.g');
legend('weight', 'food intake', 2); % reversed order; bug in Matlab?
xlabel('age, d');