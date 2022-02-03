function g1 = static_g1(T, y, x, params, T_flag)
% function g1 = static_g1(T, y, x, params, T_flag)
%
% File created by Dynare Preprocessor from .mod file
%
% Inputs:
%   T         [#temp variables by 1]  double   vector of temporary terms to be filled by function
%   y         [M_.endo_nbr by 1]      double   vector of endogenous variables in declaration order
%   x         [M_.exo_nbr by 1]       double   vector of exogenous variables in declaration order
%   params    [M_.param_nbr by 1]     double   vector of parameter values in declaration order
%                                              to evaluate the model
%   T_flag    boolean                 boolean  flag saying whether or not to calculate temporary terms
%
% Output:
%   g1
%

if T_flag
    T = cia_dynare_152812.static_g1_tt(T, y, x, params);
end
g1 = zeros(12, 12);
g1(1,12)=1-params(10);
g1(2,11)=1-params(11);
g1(2,12)=(-params(14));
g1(3,1)=1;
g1(3,2)=(-params(1));
g1(3,3)=(-(1-params(1)));
g1(3,12)=(-1);
g1(4,1)=params(3);
g1(4,4)=(-params(4));
g1(4,5)=(-params(6));
g1(5,2)=1-(1-params(6));
g1(5,5)=(-params(6));
g1(6,1)=(-(params(1)*params(3)));
g1(6,2)=params(1)*params(3);
g1(6,7)=1;
g1(7,1)=1;
g1(7,3)=(-(1+params(7)*params(16)/(1-params(16))));
g1(7,6)=1;
g1(8,7)=(-1);
g1(9,4)=params(13);
g1(9,6)=1;
g1(9,8)=params(15);
g1(10,4)=(-params(15));
g1(10,10)=1;
g1(11,9)=1;
g1(11,11)=(-1);
g1(12,7)=(-1);
g1(12,8)=1;
g1(12,9)=(-1);
if ~isreal(g1)
    g1 = real(g1)+2*imag(g1);
end
end
