function residual = static_resid(T, y, x, params, T_flag)
% function residual = static_resid(T, y, x, params, T_flag)
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
%   residual
%

if T_flag
    T = miu_dynare_3e_152812.static_resid_tt(T, y, x, params);
end
residual = zeros(12, 1);
lhs = y(1);
rhs = y(1)*params(14)+x(1);
residual(1) = lhs - rhs;
lhs = y(2);
rhs = y(2)*params(15)+y(1)*params(18)+x(2);
residual(2) = lhs - rhs;
lhs = y(5);
rhs = params(7)*y(6)+y(5)*(1-params(7));
residual(3) = lhs - rhs;
lhs = y(9);
rhs = y(2)+y(9)-y(12);
residual(4) = lhs - rhs;
lhs = y(3);
rhs = y(1)+y(5)*params(3)+(1-params(3))*y(7);
residual(5) = lhs - rhs;
lhs = y(3)*params(20);
rhs = params(7)*y(6)+params(21)*y(4);
residual(6) = lhs - rhs;
lhs = y(7)*(1+params(5)*params(19)/(1-params(19)));
rhs = y(3)+y(11);
residual(7) = lhs - rhs;
lhs = y(11);
rhs = y(4)*params(9)+y(9)*params(10);
residual(8) = lhs - rhs;
lhs = y(9);
rhs = y(4)-T(1)*y(10);
residual(9) = lhs - rhs;
lhs = y(8);
rhs = y(11)*params(20)*params(3)*(1-params(3))/params(29)+y(1)*T(2)-y(5)*T(3);
residual(10) = lhs - rhs;
residual(11) = y(8);
lhs = y(10);
rhs = y(12)+y(8);
residual(12) = lhs - rhs;
if ~isreal(residual)
  residual = real(residual)+imag(residual).^2;
end
end
