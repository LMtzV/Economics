clear all

%A MI ME PARECIO INTERESANTE QUE PASA CON LAS PRICNIPALES VARIABLES
%MACROECONOMICAS DE INTERES(ESTO, ES LAS PRINCIPALES VARIABLES QUE
%ANALIZAMOS EN ECO V) CUANDO EXISTE UN CHOQUE A LA PRODUCTIVIDAD

% CITA:
% Seitani, Haruki. (2013). Matlab Toolkit for Simulating Dynamic Stochastic 
% General Equilibrium Models. 



%Inicialización de parámetros del modelo(bien calibrados)
%Aqui tambien podemos jugar un poco con el valor de los parametros
alpha = 0.40 ; % Participacion del ingreso de capital
beta = 0.99; % tasa de descuento
delta = 0.025; % depreciacion del capital
Psi = 2.0 ; % utilidad marginal del trabajo
Z = 1.0 ; % Promedio de productividad(tecnologia) agregagda
sigma_z = 0.007; % desviacion estandar de la tec
rho = 0.95 ; % autocorrelacion de choques en productividad

%--- Variales ---%
syms cc lc kc zc ca la ka za;
xx = [ca la ka za cc lc kc zc];

%variables de Control
% c: consumo
% l: horas trabajadas


varname = char('Consumo', 'Horas-trabajadas', 'Capital', 'Tecnología');

% Configuración del modelo 
% 1) Analisis de choques
h = 24; % horizonte de respuesta a los choques(es una funcion) 
hit = 2; % periodo en el que sucede el choque a la tec
imp = varname(4,:); % variable que es afectada por el choque
SI = [0, 1]'; % vector de choque
% 2) comparasión de 2o's momentos
mcreps = 300; % # de simulaciones Monte-Carlo
ssize = 150; % Tamaño de las series de tiempo simuladas
disc = 300; % primeras observaciones descartadas
vars = 5; % # de variables en las que se descarta el 2o momento
% 5 variables: y, c, i, l, y/l


%%%%%%%%%%%CALCULO DEL ESTADO ESTACIONARIO(EE)%%%%%%%%%%%%%%%%
disp('=========================================')
disp(' ESTADO ESTACIONARIO ')
disp('=========================================')
disp(' K/Y CS KS LS YS IS')
KY = 1/((1-beta*(1-delta))/(alpha*beta*Z));
CY = 1-delta*KY;
LS = 1/(1+Psi/((1-alpha)/CY));
KS = LS*(alpha*beta*Z/(1-(beta*(1-delta))))^(1/(1-alpha));
YS = Z*(KS^alpha)*(LS^(1-alpha));
IS = delta*KS;
CS = YS - IS;
s = [CS, LS, KS, Z];
disp([KY, CS, KS, LS, YS, IS]);

%%%%%%%%%%%%% CONDICIONES DE EQUILIBRIO%%%%%%%%%%%%%%
% CONDICION DE OPTIMALIDAD INTRATEMP.
intra = Psi/(1-lc) - (1-alpha)*zc*((kc/lc)^(alpha))*(1/cc);


%CONDICION DE OPTIMALIDAD INTERTEMP.
inter = beta*(alpha*za*(la/ka)^(1-alpha) + (1-delta))*(1/ca) - (1/cc);

%RESTRICCION DE RECURSOS
recursos = zc*(kc^alpha)*(lc^(1-alpha)) + (1-delta)*kc - cc - ka;

%DINAMICA DEL CHOQUE A TEC
tec = za - zc^rho;

%CONDICIONES DE OPTIMALIDAD
eqcon = [intra; inter ; recursos; tec ];

%%%%%%%%%%%% LINEALIRACION Y SOLUCION DEL MODELO %%%%%%%%%%%
%DIFERENCIACION%
J = jacobian(eqcon,xx);

%EVALUAMOS EL EE.%%%
cc = CS;
ca = CS;
kc = KS;
ka = KS;
lc = LS;
la = LS;
zc = Z;
za = Z;
coef = eval(J);
SS = [ s ; s ; s ; s];
%%%%%%%SOLUCION DEL MODELO%%%%%%
[PX, PS, n, m] = bksolve(SS,s,coef);
%La función bk solve la obtuve de un toolkit que encontré en researchgate
% https://www.researchgate.net/publication/256103685_Matlab_Toolkit_for_Simulating_Dynamic_Stochastic_General_Equilibrium_Models

%%  funcion de respuesta al choque %%%%%
SC = SI;
S = zeros(h, m); 
for i = hit:h 
SA = PS*SC ; 
S(i,:) = SA'; 
SC = S(i,:)' ; 
end
S(hit,:) = SI; 
X = (PX*S')'; 
Y = [X, S];
ct = Y(:, 1);
lt = Y(:, 2);
kt = Y(:, 3);
zt = Y(:, 4);

yt = Y(:, 4) + alpha*Y(:, 3) + (1-alpha)*Y(:, 2); % Output
it = (YS/IS)*yt - (CS/IS)*Y(:, 1); % Investment
wt = yt - Y(:,2); % Marginal Product of Labor
%---- Grafica ----%
t = 1:length(yt);
set(gca, 'Fontsize', 10);
plot(t, yt,'k-', t, ct,'m--+', t, it,'r-.o', t, lt,'b:s', t, wt,'c:*',...
'Linewidth', 1.5, 'Markersize', 4.5');
axis([0,h,0,Inf]);
xlabel('Horizonte');
ylabel('% Desviacion del EstadoEstacionario');
title('Respuesta a un choque a productividad', 'Fontsize', 14);
legend('Produccion', 'Consumo', 'Inversion', 'Hours-trabajadas', 'Productividad del Trabajo');


















