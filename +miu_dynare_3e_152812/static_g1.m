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
    T = miu_dynare_3e_152812.static_g1_tt(T, y, x, params);
end
g1 = zeros(12, 12);
g1(1,1)=1-params(14);
g1(2,1)=(-params(18));
g1(2,2)=1-params(15);
g1(3,5)=1-(1-params(7));
g1(3,6)=(-params(7));
g1(4,2)=(-1);
g1(4,12)=1;
g1(5,1)=(-1);
g1(5,3)=1;
g1(5,5)=(-params(3));
g1(5,7)=(-(1-params(3)));
g1(6,3)=params(20);
g1(6,4)=(-params(21));
g1(6,6)=(-params(7));
g1(7,3)=(-1);
g1(7,7)=1+params(5)*params(19)/(1-params(19));
g1(7,11)=(-1);
g1(8,4)=(-params(9));
g1(8,9)=(-params(10));
g1(8,11)=1;
g1(9,4)=(-1);
g1(9,9)=1;
g1(9,10)=T(1);
g1(10,1)=(-T(2));
g1(10,5)=T(3);
g1(10,8)=1;
g1(10,11)=(-(params(20)*params(3)*(1-params(3))/params(29)));
g1(11,8)=1;
g1(12,8)=(-1);
g1(12,10)=1;
g1(12,12)=(-1);
if ~isreal(g1)
    g1 = real(g1)+2*imag(g1);
end
end
