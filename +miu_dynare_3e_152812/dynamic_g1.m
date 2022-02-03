function g1 = dynamic_g1(T, y, x, params, steady_state, it_, T_flag)
% function g1 = dynamic_g1(T, y, x, params, steady_state, it_, T_flag)
%
% File created by Dynare Preprocessor from .mod file
%
% Inputs:
%   T             [#temp variables by 1]     double   vector of temporary terms to be filled by function
%   y             [#dynamic variables by 1]  double   vector of endogenous variables in the order stored
%                                                     in M_.lead_lag_incidence; see the Manual
%   x             [nperiods by M_.exo_nbr]   double   matrix of exogenous variables (in declaration order)
%                                                     for all simulation periods
%   steady_state  [M_.endo_nbr by 1]         double   vector of steady state values
%   params        [M_.param_nbr by 1]        double   vector of parameter values in declaration order
%   it_           scalar                     double   time period for exogenous variables for which
%                                                     to evaluate the model
%   T_flag        boolean                    boolean  flag saying whether or not to calculate temporary terms
%
% Output:
%   g1
%

if T_flag
    T = miu_dynare_3e_152812.dynamic_g1_tt(T, y, x, params, steady_state, it_);
end
g1 = zeros(12, 20);
g1(1,1)=(-params(14));
g1(1,5)=1;
g1(1,19)=(-1);
g1(2,1)=(-params(18));
g1(2,2)=(-params(15));
g1(2,6)=1;
g1(2,20)=(-1);
g1(3,3)=(-(1-params(7)));
g1(3,9)=1;
g1(3,10)=(-params(7));
g1(4,6)=(-1);
g1(4,4)=(-1);
g1(4,13)=1;
g1(4,16)=1;
g1(5,5)=(-1);
g1(5,7)=1;
g1(5,3)=(-params(3));
g1(5,11)=(-(1-params(3)));
g1(6,7)=params(20);
g1(6,8)=(-params(21));
g1(6,10)=(-params(7));
g1(7,7)=(-1);
g1(7,11)=1+params(5)*params(19)/(1-params(19));
g1(7,15)=(-1);
g1(8,8)=(-params(9));
g1(8,13)=(-params(10));
g1(8,15)=1;
g1(9,8)=(-1);
g1(9,13)=1;
g1(9,14)=T(1);
g1(10,5)=(-T(2));
g1(10,9)=T(3);
g1(10,12)=1;
g1(10,15)=(-(params(20)*params(3)*(1-params(3))/params(29)));
g1(11,12)=1;
g1(11,15)=(-1);
g1(11,17)=1;
g1(12,12)=(-1);
g1(12,14)=1;
g1(12,18)=(-1);

end
