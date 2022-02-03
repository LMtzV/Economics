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
    T = cia_dynare_152812.static_resid_tt(T, y, x, params);
end
residual = zeros(12, 1);
lhs = y(12);
rhs = y(12)*params(10)+x(1);
residual(1) = lhs - rhs;
lhs = y(11);
rhs = y(11)*params(11)+y(12)*params(14)+x(2);
residual(2) = lhs - rhs;
lhs = y(1);
rhs = y(12)+params(1)*y(2)+(1-params(1))*y(3);
residual(3) = lhs - rhs;
lhs = y(1)*params(3);
rhs = params(4)*y(4)+params(6)*y(5);
residual(4) = lhs - rhs;
lhs = y(2);
rhs = params(6)*y(5)+y(2)*(1-params(6));
residual(5) = lhs - rhs;
lhs = y(7);
rhs = params(1)*params(3)*(y(1)-y(2));
residual(6) = lhs - rhs;
lhs = y(1);
rhs = y(3)*(1+params(7)*params(16)/(1-params(16)))-y(6);
residual(7) = lhs - rhs;
lhs = y(6);
rhs = y(7)+y(6);
residual(8) = lhs - rhs;
lhs = y(6);
rhs = y(4)*(-params(13))-params(15)*y(8);
residual(9) = lhs - rhs;
lhs = y(10);
rhs = y(4)*params(15);
residual(10) = lhs - rhs;
lhs = y(10);
rhs = y(11)+y(10)-y(9);
residual(11) = lhs - rhs;
lhs = y(8);
rhs = y(7)+y(9);
residual(12) = lhs - rhs;
if ~isreal(residual)
  residual = real(residual)+imag(residual).^2;
end
end
