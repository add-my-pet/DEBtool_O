%% fig:Comf63
%% bib:Comf63,Finc90 (p138)
%% out:Comf63,Comf63s

%% Poecilia reticulata, abundant food
aL=[ ... % age in d, length in cm
66.43993337	2.58694392;
138.75506271	3.45217778;
244.07172720	3.76037039;
341.34521165	3.96555314;
416.91027567	4.23281536;
480.25133917	4.21154380;
573.87068853	4.67449618;
708.66948654	4.79681784;
797.92428795	4.91960903;
857.28050692	4.87775999;
96.22827933	2.65880177;
148.52119807	3.33867504;
212.27871048	3.66791465;
250.06124249	3.80154576;
327.71671675	4.16156993;
401.47308597	4.57318069;
466.95355370	4.68590770;
544.52328848	4.97376780;
600.07839038	5.06597857;
681.44924223	5.21977887;
772.48824144	5.17760321;
859.64038411	5.19732330;
66.43993337	2.58694392;
136.77488895	3.45219820;
220.39538150	3.83277943;
337.47060361	4.03775804;
456.81996342	4.49013588;
522.20244317	4.52038967;
607.63163052	4.75662235;
681.03279331	4.86926770;
740.54824275	4.96143765;
900.97906323	4.99071156;
103.96524693	2.50408283;
125.80840084	2.55540404;
141.68653645	2.58616818;
166.03654952	3.08076251;
239.59694278	3.32742684;
295.44600862	3.66705726;
352.89554481	3.68708355;
420.63790175	4.03690064;
521.99421871	4.34513408;
642.94404886	4.47790779;
738.02913509	4.50785537;
101.99732166	2.51441240;
149.61948001	2.59639568;
182.03717011	3.21461817;
277.61219624	3.65693183;
401.25261301	4.38761595;
490.66664489	4.64442612;
572.31921218	5.03533692;
588.25859028	5.11764682;
711.23758819	5.29163673;
950.89985628	5.34071237;
126.01662529	2.73065962;
189.82313170	3.10113584;
235.48961327	3.20375784;
299.19813170	3.49176084;
349.08217925	3.81083420;
420.55216227	3.96473658;
571.57205383	4.40647864;
716.47994513	4.70395381;
797.78955448	4.80620836;
859.16269271	4.79526636;
    938.44313431	4.85630471];
aL = sortrows(aL,1);

%% food restriction in  period 100-600 d
aLf = [ ... % age in d, length in cm
5.98583474e+001	2.47242755e+000;
1.29889045e+002	2.68587630e+000;
2.85745975e+002	2.89668153e+000;
4.43656243e+002	3.17929209e+000;
5.15551748e+002	3.22841235e+000;
5.83561896e+002	3.41112251e+000;
6.53854896e+002	3.95310528e+000;
7.36140044e+002	4.51525255e+000;
7.82129068e+002	4.61650546e+000;
8.79947448e+002	4.63402645e+000;
1.29684121e+002	2.42920910e+000;
1.83804526e+002	2.71501648e+000;
2.05751877e+002	2.70407354e+000;
2.53728663e+002	2.79499828e+000;
2.89672317e+002	2.81442507e+000;
3.45649333e+002	2.92563727e+000;
4.17536641e+002	2.96449085e+000;
4.41488148e+002	2.96375312e+000;
5.11420482e+002	3.05400161e+000;
5.31396465e+002	3.07392022e+000;
5.89369440e+002	3.18507095e+000;
6.05394490e+002	3.25644595e+000;
6.69478296e+002	3.52141256e+000;
7.09528625e+002	3.68445003e+000;
9.38880122e+001	2.59458270e+000;
1.23819199e+002	2.58339385e+000;
1.39827855e+002	2.63423547e+000;
1.49881422e+002	2.72632828e+000;
1.90021918e+002	3.00229931e+000;
2.78024442e+002	3.22546145e+000;
3.78068296e+002	3.53038823e+000;
3.96048320e+002	3.55036831e+000;
4.40082370e+002	3.70301613e+000;
4.80034336e+002	3.74285334e+000;
5.29982490e+002	3.80291654e+000;
5.59946465e+002	3.83279445e+000;
5.79996220e+002	3.94511324e+000;
6.16046435e+002	4.09800697e+000;
6.52047468e+002	4.18930058e+000;
6.98118461e+002	4.39322036e+000;
7.36107256e+002	4.47418580e+000;
8.06072378e+002	4.60550104e+000;
8.44061173e+002	4.68646648e+000;
9.38634213e+001	2.56378263e+000;
2.96029057e+002	3.27624160e+000;
3.28005384e+002	3.32659140e+000;
4.75903070e+002	3.56844260e+000;
5.39839330e+002	3.64860884e+000;
5.77770747e+002	3.65770746e+000;
5.87807920e+002	3.72926689e+000;
5.93869569e+002	3.82148265e+000;
6.42002097e+002	4.10747446e+000;
6.70101264e+002	4.30168085e+000;
7.04229292e+002	4.54703625e+000;
7.32221899e+002	4.60777570e+000;
8.06195332e+002	4.75950136e+000;
8.46171889e+002	4.83013863e+000;
8.70147987e+002	4.86020097e+000;
9.48088747e+002	4.98100362e+000;
1.33692433e+002	2.44961952e+000;
1.77808453e+002	2.70493422e+000;
2.37900340e+002	2.97002379e+000;
2.87815707e+002	2.98902024e+000;
3.35759705e+002	3.03887823e+000;
4.41766845e+002	3.31282051e+000;
4.83739360e+002	3.38339631e+000;
5.33720302e+002	3.48452626e+000;
5.65762205e+002	3.61700957e+000;
6.15816920e+002	3.81053971e+000;
7.25848765e+002	4.12542579e+000;
7.69981179e+002	4.40127387e+000;
8.09924948e+002	4.43084439e+000;
8.45893193e+002	4.48107124e+000;
8.65852782e+002	4.48045647e+000;
3.71908283e+002	3.31497221e+000;
8.19806379e+002	4.30733675e+000];
aLf = sortrows(aLf,1);

%% abundant food
aS = [ ... % age in d, fraction survivors
0.00000000e+000	1.00000000e+000;
1.22727616e+002	9.88417446e-001;
2.00081243e+002	9.71978273e-001;
3.73007114e+002	9.82723230e-001;
7.07125319e+002	9.18501530e-001;
8.14014099e+002	8.21243309e-001;
1.09795562e+003	4.35219303e-001;
1.29451392e+003	3.21414064e-001;
1.51059937e+003	8.30945765e-002;
1.72897831e+003	0.000];

%% restricted food in period 100--600 d
aSf = [ ... % age in d, fraction survivors
0.00000000	1.00000000;
114.73270615	0.99374139;
274.26422745	0.97833394;
886.53627007	0.88715818;
995.36625961	0.83716842;
1087.78223937	0.68749753;
1204.89472530	0.63918656;
1407.57862800	0.47453959;
1593.06484720	0.09112903;
1722.34943939	0.03920885;
1848.03200840	0.000];

Lb = .3;   % cm
g = .4982;
kM = 0.05; % 1/d
v = .1232; % cm/d
ha = .1137;% 10^-6 d^-2
sG = 0.129;
f0 = .7259;

p = [Lb 0; g 1; kM 0; v 1; ha 1; sG 1; f0 1];

nrregr_options('report', 1);
nrregr_options('max_step_number', 20);
p = nrregr('eLqhS', p, aL, aS, aLf, aSf);
[cov cor sd ssq] = pregr('eLqhS', p, aL, aS, aLf, aSf);
nm = ['birth length Lb'; 'energy investment ratio g';
      'maint rate coeff kM'; 'energy conductance v';
      'aging acceleration 1e6 * ha'; 'Gompertz coefficient sG';
      'f at starvation'];
printpar(nm,p(:,1),sd);

a_L = linspace(1e-6,1000,100)'; a_S = linspace(1e-6,2000,100)';
[L, S, Lf, Sf] = eLqhS(p(:,1), a_L, a_S, a_L, a_S);


clf

subplot(1,2,1)
%% gset output 'Comf63.ps'
plot(aL(:,1), aL(:,2), 'or', a_L, L, 'r', ...
     aLf(:,1), aLf(:,2), '*b', a_L, Lf, 'b')

subplot(1,2,2)
%% gset output 'Comf63_S.ps'
plot(aS(:,1), aS(:,2), 'or', a_S, S, 'r', ...
     aSf(:,1), aSf(:,2), '*b', a_S, Sf, 'b')