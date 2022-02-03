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
    T = miu_dynare_3e_152812.dynamic_resid_tt(T, y, x, params, steady_state, it_);
end
residual = zeros(12, 1);
lhs = y(5);
rhs = params(14)*y(1)+x(it_, 1);
residual(1) = lhs - rhs;
lhs = y(6);
rhs = params(15)*y(2)+y(1)*params(18)+x(it_, 2);
residual(2) = lhs - rhs;
lhs = y(9);
rhs = params(7)*y(10)+(1-params(7))*y(3);
residual(3) = lhs - rhs;
lhs = y(13);
rhs = y(6)+y(4)-y(16);
residual(4) = lhs - rhs;
lhs = y(7);
rhs = y(5)+y(3)*params(3)+(1-params(3))*y(11);
residual(5) = lhs - rhs;
lhs = y(7)*params(20);
rhs = params(7)*y(10)+params(21)*y(8);
residual(6) = lhs - rhs;
lhs = y(11)*(1+params(5)*params(19)/(1-params(19)));
rhs = y(7)+y(15);
residual(7) = lhs - rhs;
lhs = y(15);
rhs = y(8)*params(9)+y(13)*params(10);
residual(8) = lhs - rhs;
lhs = y(13);
rhs = y(8)-T(1)*y(14);
residual(9) = lhs - rhs;
lhs = y(12);
rhs = y(15)*params(20)*params(3)*(1-params(3))/params(29)+y(5)*T(2)-y(9)*T(3);
residual(10) = lhs - rhs;
lhs = y(12);
rhs = y(15)-y(17);
residual(11) = lhs - rhs;
lhs = y(14);
rhs = y(12)+y(18);
residual(12) = lhs - rhs;

end
