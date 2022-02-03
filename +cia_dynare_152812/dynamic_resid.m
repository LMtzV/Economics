function residual = dynamic_resid(T, y, x, params, steady_state, it_, T_flag)
% function residual = dynamic_resid(T, y, x, params, steady_state, it_, T_flag)
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
%   residual
%

if T_flag
    T = cia_dynare_152812.dynamic_resid_tt(T, y, x, params, steady_state, it_);
end
residual = zeros(12, 1);
lhs = y(16);
rhs = params(10)*y(4)+x(it_, 1);
residual(1) = lhs - rhs;
lhs = y(15);
rhs = params(11)*y(3)+y(4)*params(14)+x(it_, 2);
residual(2) = lhs - rhs;
lhs = y(5);
rhs = y(16)+params(1)*y(1)+(1-params(1))*y(7);
residual(3) = lhs - rhs;
lhs = y(5)*params(3);
rhs = params(4)*y(8)+params(6)*y(9);
residual(4) = lhs - rhs;
lhs = y(6);
rhs = params(6)*y(9)+y(1)*(1-params(6));
residual(5) = lhs - rhs;
lhs = y(11);
rhs = params(1)*params(3)*(y(17)-y(6));
residual(6) = lhs - rhs;
lhs = y(5);
rhs = y(7)*(1+params(7)*params(16)/(1-params(16)))-y(10);
residual(7) = lhs - rhs;
lhs = y(10);
rhs = y(11)+y(18);
residual(8) = lhs - rhs;
lhs = y(10);
rhs = y(8)*(-params(13))-params(15)*y(12);
residual(9) = lhs - rhs;
lhs = y(14);
rhs = y(8)*params(15);
residual(10) = lhs - rhs;
lhs = y(14);
rhs = y(15)+y(2)-y(13);
residual(11) = lhs - rhs;
lhs = y(12);
rhs = y(11)+y(19);
residual(12) = lhs - rhs;

end
