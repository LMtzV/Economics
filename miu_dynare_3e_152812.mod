// miu_ch2_3e.mod
// Dynare program for MIU model
// Monetary Theory and Policy, 3rd ed., by Carl E. Walsh
// The MIT Press.
// En matlab, poner:
// addpath c:\dynare\4.4.2\matlab 
// Esto le dice a matlab donde está Dynare.
// posteriormente, ejecutamos el modelo (.mod) con el siguiente comando:


var Z U Y C K INV N R M I MUC PI;

varexo EPZ EPU;

parameters A B ALPHA BETA ETA MC DELTA GAMMA OMEGA1 OMEGA2 SIGMA_Z SIGMA_M SIGMA_V;
parameters RHOZ RHOU THETA PHI phi NSS YK CK NKSS KSS CSS RSS ISS MSS XSS RR;

%Valores Por LGMV reparametrización con log-regresores
ALPHA = 0.36;
DELTA = 0.1980123;
BETA = 0.9182917;
ETA = 1;
THETA = 1.97882526;
PHI = 2.7989716673;
phi = 0;
A = 0.975;
B = 2.988090; %1/.39;
NSS = 1/3;
YK = (1/ALPHA)*((1/BETA) - 1 + DELTA);
CK = YK - DELTA;
NKSS = (YK)^(1/(1-ALPHA));
KSS = NSS/NKSS;
CSS = CK*KSS;
RSS = 1/BETA;
ISS = (RSS*THETA - 1);
MSS = CSS*(A*ISS/((1-A)*(1+ISS)))^(-1/B);
XSS = A*(CSS^(1-B)) + (1-A)*(MSS^(1-B));
RR = ALPHA + (ETA*NSS/(1-NSS)) + ALPHA*(1-ALPHA)*YK;

GAMMA = A*(CSS^(1-B))/XSS; 
OMEGA1 = (B - PHI)*GAMMA - B;
OMEGA2 = (B - PHI)*(1-GAMMA);
SIGMA_Z = 0.34;
RHOZ = 0.95;
RHOU = 0.67;
SIGMA_M = .95;% standard deviation of money growth rate shock. Units: Percent
% Innovation variance of money growth shock set so that s.d. of money
% growth matches SIGMA_M.
SIGMA_V = ((1-RHOU^2)*(SIGMA_M)^2 - ((phi^2)/(1-RHOZ^2))*(SIGMA_Z^2))^.5;

model(linear);
    Z = RHOZ*Z(-1) + EPZ;
    U = RHOU*U(-1)+ phi*Z(-1) + EPU;
    K = DELTA*INV + (1 - DELTA)*K(-1);
    M = M(-1) + U - PI;
    Y = ALPHA*K(-1) + (1-ALPHA)*N + Z;
    YK*Y = CK*C + DELTA*INV;
    (1 + (ETA*NSS/(1-NSS)))*N = Y + MUC;
    MUC = OMEGA1*C + OMEGA2*M;    
    M = C - (1/B)*(1/ISS)*I;
    R = (ALPHA*(1-ALPHA)*YK/RR)*MUC + (RHOZ*(ALPHA*YK*(1+ETA*(NSS/(1-NSS))))/RR)*Z - (ALPHA*(1-ALPHA)*YK*ETA*(NSS/(1-NSS))/RR)*K;
    R = MUC - MUC(+1); 
    I = R + PI(+1);
end;

steady;
check;


shocks;
var EPZ;
stderr SIGMA_Z;
var EPU;
stderr SIGMA_V;
end;

stoch_simul(irf=300);
