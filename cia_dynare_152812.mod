// Dynare: programa para modelo CIA de Cap. 3
// Monetary Theory and Policy, 4th ed., by Carl E. Walsh
// The MIT Press. 2016
// ------------------------------------------------------------------------

var Y K N C INV MUY R I PI M U Z;

varexo EPZ EPU;

parameters ALPHA BETA YK CK RSS DELTA ETA B ISS;
parameters RHOZ RHOU THETA PHI phi PSI NSS SIGMA_U SIGMA_Z SIGMA_M ;
ALPHA = 0.36;
DELTA = 0.019;
BETA = 0.989;
ETA = 1;
THETA = 1.0138;
SIGMA = 1;
PHI = 2;
// PSI= 0.25, 0.5, 0.75 y 1
PSI=0.75;
B = 9; 
phi = 0;
YK = (1/ALPHA)*((1/BETA) - 1 + DELTA);
CK = YK - DELTA;

// Nota: Tasas EstadoEstacionario real y nominal son brutas.
// i.e, RSS = 1+r and ISS = 1+i.
RSS = 1/BETA; 
ISS = RSS*THETA;

NSS = 1/3;

RHOZ = 0.9;
RHOU = 0.67;
SIGMA_Z = 0.34;
SIGMA_M = 1.17;
SIGMA_U = ((1-RHOU^2)*(SIGMA_M)^2 - ((phi^2)/(1-RHOZ^2))*(SIGMA_Z^2))^.5;

model(linear);
    Z = RHOZ*Z(-1) + EPZ;
    U = RHOU*U(-1)+ phi*Z(-1) + EPU;
    Y = ALPHA*K(-1) + (1-ALPHA)*N + Z;
    YK*Y = CK*C + DELTA*INV;
    K = (1-DELTA)*K(-1) + DELTA*INV;
    R  = ALPHA*YK*(Y(+1) - K) ; 
    Y = (1 + (ETA*NSS/(1-NSS)))*N - MUY;
    MUY = MUY(+1) + R; 
    MUY = -PHI*C - (PSI*I); 
    M = PSI*C;
    M = M(-1) + U - PI;
    I = R + PI(+1);
end;

steady;
check;

shocks;
var EPZ;
stderr SIGMA_Z;
var EPU;
stderr SIGMA_U;
end;

/////////////////////////////////////////
// calulamos Momentos Teoricos e IRF's
////////////////////////////////////////
stoch_simul(order=1,ar=1,irf=60,nograph,print);
OOPT.MODELS.CIA1 =   oo_;
save OOPT_CIA1;

phi = -0.5;
// Si no comento la sigte. linea mantenemos desvest. de m constante al verificar phi
//SIGMA_U = ((1-RHOU^2)*(SIGMA_M)^2 - ((phi^2)/(1-RHOZ^2))*(SIGMA_Z^2))^.5;
stoch_simul(order=1,ar=1,irf=60,nograph,print);
OOPT.MODELS.CIA2 =   oo_;
save OOPT_CIA2;

phi = 0.5;
// Si no comento la sigte. linea mantenemos desvest. de m constante al verificar phi
//SIGMA_U = ((1-RHOU^2)*(SIGMA_M)^2 - ((phi^2)/(1-RHOZ^2))*(SIGMA_Z^2))^.5;
stoch_simul(order=1,ar=1,irf=60,nograph,print);
OOPT.MODELS.CIA3 =   oo_;
//OOPT_CIA_3 = OOPT.MODELS.CIA_3;
save OOPT_CIA3;


RHOU = 0.9;
phi = 0;
// Si no comento la sigte. linea mantenemos desvest. de m constante al verificar phi
//SIGMA_U = ((1-RHOU^2)*(SIGMA_M)^2 - ((phi^2)/(1-RHOZ^2))*(SIGMA_Z^2))^.5;
stoch_simul(order=1,ar=1,irf=60,nograph,noprint);
OOPT.MODELS.CIA4 =   oo_;
//OOPT_CIA_3 = OOPT.MODELS.CIA_3;
save OOPT_CIA4;



/////////////////////////////////////////
// Graficamos funciones: Impulse-Response 
// 
////////////////////////////////////////

OOPT.NN=40;
OOPT.plot_color={'k' 'b:' 'r-.'};
OOPT.shocks_names={'EPZ'};
OOPT.tit_shocks={'Choque a productividad'};
OOPT.type_models={'CIA2' 'CIA1' 'CIA3'};
OOPT.legend_models={'\phi = -0.5' '\phi = 0' '\phi = 0.5'};
%%OOPT.list_endo={'Y' 'C' 'INV' 'K' 'N' 'R' 'I' 'PI' 'U'};
%%OOPT.label_variables={'Produccion' 'Consumo' 'Inversion' 'Capital' 'Empleo' 'TasaInteresReal' 'TasaInteresNominal' 'TasaInflacion' 'Dinero'};
OOPT.list_endo={'Y' 'N' 'R' 'I' 'PI' 'M'};
OOPT.label_variables={'Produccion' 'Empleo' 'TasaInteresreal' 'TasInteresNominal' 'TasaInflacion' 'Oferta Monetaria Real'};
plot_comp(OOPT);
print -depsc2 'Figure2.a'



OOPT.NN=40;
OOPT.plot_color={'b' 'r:'};
OOPT.shocks_names={'EPU'};
OOPT.tit_shocks={'Choque por politica'};
OOPT.type_models={'CIA1' 'CIA4'};
OOPT.legend_models={'\rho_u = 0.67' '\rho_u = 0.9'};
//OOPT.list_endo={'Y' 'C' 'INV' 'K' 'N' 'R' 'I' 'PI' 'U'};
//OOPT.label_variables={'Produccion' 'Consumo' 'Inversion' 'Capital' 'Empleo' 'TasaInteresReal' 'TasaInteresNominal' 'TasaInflacion' 'Dinero'};
OOPT.list_endo={'Y' 'N' 'R' 'I' 'PI' 'M'};
OOPT.label_variables={'Produccion' 'Empleo' 'TasaInteresreal' 'TasInteresNominal' 'TasaInflacion' 'Oferta Monetaria Real'};
plot_comp(OOPT);
print -depsc2 'Figure1.a'

OOPT.NN=12;
OOPT.plot_color={'o-b' 'd-k'};
OOPT.shocks_names={'EPZ'};
OOPT.tit_shocks={'Choque a productividad'};
OOPT.type_models={'CIA1' 'CIA2'};
OOPT.legend_models={'\phi = 3.0' '\phi = -3.0'};
OOPT.list_endo={'Y' 'C' 'INV' 'K' 'N' 'R' 'I' 'PI' 'Z'};
OOPT.label_variables={'Produccion' 'Consumo' 'Inversion' 'Capital' 'Empleo' 'tasa Interes real' 'tasa Interes Nominal' 'tasa inflacion' 'Choque a productividad'};
plot_comp(OOPT);
print -depsc2 'Figure 1'

OOPT.NN=12;
OOPT.plot_color={'o-b' 'd-k'};
OOPT.shocks_names={'EPU'};
OOPT.tit_shocks={'Choque por politica'};
OOPT.type_models={'CIA1' 'CIA3'};
OOPT.legend_models={'\rho_u = 0.67' '\rho_u = 0.9'};
OOPT.list_endo={'Y' 'C' 'INV' 'K' 'N' 'R' 'I' 'PI' 'U'};
OOPT.label_variables={'Produccion' 'Consumo' 'Inversion' 'Capital' 'Empleo' 'TasaInteresReal' 'TasaInteresNominal' 'TasaInflacion' 'Dinero'};
plot_comp(OOPT);
print -depsc2 'Figure 2'