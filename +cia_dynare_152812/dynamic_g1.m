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
    T = cia_dynare_152812.dynamic_g1_tt(T, y, x, params, steady_state, it_);
end
g1 = zeros(12, 21);
g1(1,4)=(-params(10));
g1(1,16)=1;
g1(1,20)=(-1);
g1(2,3)=(-params(11));
g1(2,15)=1;
g1(2,4)=(-params(14));
g1(2,21)=(-1);
g1(3,5)=1;
g1(3,1)=(-params(1));
g1(3,7)=(-(1-params(1)));
g1(3,16)=(-1);
g1(4,5)=params(3);
g1(4,8)=(-params(4));
g1(4,9)=(-params(6));
g1(5,1)=(-(1-params(6)));
g1(5,6)=1;
g1(5,9)=(-params(6));
g1(6,17)=(-(params(1)*params(3)));
g1(6,6)=params(1)*params(3);
g1(6,11)=1;
g1(7,5)=1;
g1(7,7)=(-(1+params(7)*params(16)/(1-params(16))));
g1(7,10)=1;
g1(8,10)=1;
g1(8,18)=(-1);
g1(8,11)=(-1);
g1(9,8)=params(13);
g1(9,10)=1;
g1(9,12)=params(15);
g1(10,8)=(-params(15));
g1(10,14)=1;
g1(11,13)=1;
g1(11,2)=(-1);
g1(11,14)=1;
g1(11,15)=(-1);
g1(12,11)=(-1);
g1(12,12)=1;
g1(12,19)=(-1);

end
