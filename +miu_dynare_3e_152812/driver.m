%
% Status : main Dynare file
%
% Warning : this file is generated automatically by Dynare
%           from model file (.mod)

if isoctave || matlab_ver_less_than('8.6')
    clear all
else
    clearvars -global
    clear_persistent_variables(fileparts(which('dynare')), false)
end
tic0 = tic;
% Define global variables.
global M_ options_ oo_ estim_params_ bayestopt_ dataset_ dataset_info estimation_info ys0_ ex0_
options_ = [];
M_.fname = 'miu_dynare_3e_152812';
M_.dynare_version = '4.6.3';
oo_.dynare_version = '4.6.3';
options_.dynare_version = '4.6.3';
%
% Some global variables initialization
%
global_initialization;
diary off;
diary('miu_dynare_3e_152812.log');
M_.exo_names = cell(2,1);
M_.exo_names_tex = cell(2,1);
M_.exo_names_long = cell(2,1);
M_.exo_names(1) = {'EPZ'};
M_.exo_names_tex(1) = {'EPZ'};
M_.exo_names_long(1) = {'EPZ'};
M_.exo_names(2) = {'EPU'};
M_.exo_names_tex(2) = {'EPU'};
M_.exo_names_long(2) = {'EPU'};
M_.endo_names = cell(12,1);
M_.endo_names_tex = cell(12,1);
M_.endo_names_long = cell(12,1);
M_.endo_names(1) = {'Z'};
M_.endo_names_tex(1) = {'Z'};
M_.endo_names_long(1) = {'Z'};
M_.endo_names(2) = {'U'};
M_.endo_names_tex(2) = {'U'};
M_.endo_names_long(2) = {'U'};
M_.endo_names(3) = {'Y'};
M_.endo_names_tex(3) = {'Y'};
M_.endo_names_long(3) = {'Y'};
M_.endo_names(4) = {'C'};
M_.endo_names_tex(4) = {'C'};
M_.endo_names_long(4) = {'C'};
M_.endo_names(5) = {'K'};
M_.endo_names_tex(5) = {'K'};
M_.endo_names_long(5) = {'K'};
M_.endo_names(6) = {'INV'};
M_.endo_names_tex(6) = {'INV'};
M_.endo_names_long(6) = {'INV'};
M_.endo_names(7) = {'N'};
M_.endo_names_tex(7) = {'N'};
M_.endo_names_long(7) = {'N'};
M_.endo_names(8) = {'R'};
M_.endo_names_tex(8) = {'R'};
M_.endo_names_long(8) = {'R'};
M_.endo_names(9) = {'M'};
M_.endo_names_tex(9) = {'M'};
M_.endo_names_long(9) = {'M'};
M_.endo_names(10) = {'I'};
M_.endo_names_tex(10) = {'I'};
M_.endo_names_long(10) = {'I'};
M_.endo_names(11) = {'MUC'};
M_.endo_names_tex(11) = {'MUC'};
M_.endo_names_long(11) = {'MUC'};
M_.endo_names(12) = {'PI'};
M_.endo_names_tex(12) = {'PI'};
M_.endo_names_long(12) = {'PI'};
M_.endo_partitions = struct();
M_.param_names = cell(29,1);
M_.param_names_tex = cell(29,1);
M_.param_names_long = cell(29,1);
M_.param_names(1) = {'A'};
M_.param_names_tex(1) = {'A'};
M_.param_names_long(1) = {'A'};
M_.param_names(2) = {'B'};
M_.param_names_tex(2) = {'B'};
M_.param_names_long(2) = {'B'};
M_.param_names(3) = {'ALPHA'};
M_.param_names_tex(3) = {'ALPHA'};
M_.param_names_long(3) = {'ALPHA'};
M_.param_names(4) = {'BETA'};
M_.param_names_tex(4) = {'BETA'};
M_.param_names_long(4) = {'BETA'};
M_.param_names(5) = {'ETA'};
M_.param_names_tex(5) = {'ETA'};
M_.param_names_long(5) = {'ETA'};
M_.param_names(6) = {'MC'};
M_.param_names_tex(6) = {'MC'};
M_.param_names_long(6) = {'MC'};
M_.param_names(7) = {'DELTA'};
M_.param_names_tex(7) = {'DELTA'};
M_.param_names_long(7) = {'DELTA'};
M_.param_names(8) = {'GAMMA'};
M_.param_names_tex(8) = {'GAMMA'};
M_.param_names_long(8) = {'GAMMA'};
M_.param_names(9) = {'OMEGA1'};
M_.param_names_tex(9) = {'OMEGA1'};
M_.param_names_long(9) = {'OMEGA1'};
M_.param_names(10) = {'OMEGA2'};
M_.param_names_tex(10) = {'OMEGA2'};
M_.param_names_long(10) = {'OMEGA2'};
M_.param_names(11) = {'SIGMA_Z'};
M_.param_names_tex(11) = {'SIGMA\_Z'};
M_.param_names_long(11) = {'SIGMA_Z'};
M_.param_names(12) = {'SIGMA_M'};
M_.param_names_tex(12) = {'SIGMA\_M'};
M_.param_names_long(12) = {'SIGMA_M'};
M_.param_names(13) = {'SIGMA_V'};
M_.param_names_tex(13) = {'SIGMA\_V'};
M_.param_names_long(13) = {'SIGMA_V'};
M_.param_names(14) = {'RHOZ'};
M_.param_names_tex(14) = {'RHOZ'};
M_.param_names_long(14) = {'RHOZ'};
M_.param_names(15) = {'RHOU'};
M_.param_names_tex(15) = {'RHOU'};
M_.param_names_long(15) = {'RHOU'};
M_.param_names(16) = {'THETA'};
M_.param_names_tex(16) = {'THETA'};
M_.param_names_long(16) = {'THETA'};
M_.param_names(17) = {'PHI'};
M_.param_names_tex(17) = {'PHI'};
M_.param_names_long(17) = {'PHI'};
M_.param_names(18) = {'phi'};
M_.param_names_tex(18) = {'phi'};
M_.param_names_long(18) = {'phi'};
M_.param_names(19) = {'NSS'};
M_.param_names_tex(19) = {'NSS'};
M_.param_names_long(19) = {'NSS'};
M_.param_names(20) = {'YK'};
M_.param_names_tex(20) = {'YK'};
M_.param_names_long(20) = {'YK'};
M_.param_names(21) = {'CK'};
M_.param_names_tex(21) = {'CK'};
M_.param_names_long(21) = {'CK'};
M_.param_names(22) = {'NKSS'};
M_.param_names_tex(22) = {'NKSS'};
M_.param_names_long(22) = {'NKSS'};
M_.param_names(23) = {'KSS'};
M_.param_names_tex(23) = {'KSS'};
M_.param_names_long(23) = {'KSS'};
M_.param_names(24) = {'CSS'};
M_.param_names_tex(24) = {'CSS'};
M_.param_names_long(24) = {'CSS'};
M_.param_names(25) = {'RSS'};
M_.param_names_tex(25) = {'RSS'};
M_.param_names_long(25) = {'RSS'};
M_.param_names(26) = {'ISS'};
M_.param_names_tex(26) = {'ISS'};
M_.param_names_long(26) = {'ISS'};
M_.param_names(27) = {'MSS'};
M_.param_names_tex(27) = {'MSS'};
M_.param_names_long(27) = {'MSS'};
M_.param_names(28) = {'XSS'};
M_.param_names_tex(28) = {'XSS'};
M_.param_names_long(28) = {'XSS'};
M_.param_names(29) = {'RR'};
M_.param_names_tex(29) = {'RR'};
M_.param_names_long(29) = {'RR'};
M_.param_partitions = struct();
M_.exo_det_nbr = 0;
M_.exo_nbr = 2;
M_.endo_nbr = 12;
M_.param_nbr = 29;
M_.orig_endo_nbr = 12;
M_.aux_vars = [];
M_.Sigma_e = zeros(2, 2);
M_.Correlation_matrix = eye(2, 2);
M_.H = 0;
M_.Correlation_matrix_ME = 1;
M_.sigma_e_is_diagonal = true;
M_.det_shocks = [];
options_.linear = true;
options_.block = false;
options_.bytecode = false;
options_.use_dll = false;
options_.linear_decomposition = false;
M_.nonzero_hessian_eqs = [];
M_.hessian_eq_zero = isempty(M_.nonzero_hessian_eqs);
M_.orig_eq_nbr = 12;
M_.eq_nbr = 12;
M_.ramsey_eq_nbr = 0;
M_.set_auxiliary_variables = exist(['./+' M_.fname '/set_auxiliary_variables.m'], 'file') == 2;
M_.epilogue_names = {};
M_.epilogue_var_list_ = {};
M_.orig_maximum_endo_lag = 1;
M_.orig_maximum_endo_lead = 1;
M_.orig_maximum_exo_lag = 0;
M_.orig_maximum_exo_lead = 0;
M_.orig_maximum_exo_det_lag = 0;
M_.orig_maximum_exo_det_lead = 0;
M_.orig_maximum_lag = 1;
M_.orig_maximum_lead = 1;
M_.orig_maximum_lag_with_diffs_expanded = 1;
M_.lead_lag_incidence = [
 1 5 0;
 2 6 0;
 0 7 0;
 0 8 0;
 3 9 0;
 0 10 0;
 0 11 0;
 0 12 0;
 4 13 0;
 0 14 0;
 0 15 17;
 0 16 18;]';
M_.nstatic = 6;
M_.nfwrd   = 2;
M_.npred   = 4;
M_.nboth   = 0;
M_.nsfwrd   = 2;
M_.nspred   = 4;
M_.ndynamic   = 6;
M_.dynamic_tmp_nbr = [3; 0; 0; 0; ];
M_.model_local_variables_dynamic_tt_idxs = {
};
M_.equations_tags = {
  1 , 'name' , 'Z' ;
  2 , 'name' , 'U' ;
  3 , 'name' , 'K' ;
  4 , 'name' , 'M' ;
  5 , 'name' , 'Y' ;
  6 , 'name' , '6' ;
  7 , 'name' , '7' ;
  8 , 'name' , 'MUC' ;
  9 , 'name' , '9' ;
  10 , 'name' , 'R' ;
  11 , 'name' , '11' ;
  12 , 'name' , 'I' ;
};
M_.mapping.Z.eqidx = [1 2 5 10 ];
M_.mapping.U.eqidx = [2 4 ];
M_.mapping.Y.eqidx = [5 6 7 ];
M_.mapping.C.eqidx = [6 8 9 ];
M_.mapping.K.eqidx = [3 5 10 ];
M_.mapping.INV.eqidx = [3 6 ];
M_.mapping.N.eqidx = [5 7 ];
M_.mapping.R.eqidx = [10 11 12 ];
M_.mapping.M.eqidx = [4 8 9 ];
M_.mapping.I.eqidx = [9 12 ];
M_.mapping.MUC.eqidx = [7 8 10 11 ];
M_.mapping.PI.eqidx = [4 12 ];
M_.mapping.EPZ.eqidx = [1 ];
M_.mapping.EPU.eqidx = [2 ];
M_.static_and_dynamic_models_differ = false;
M_.has_external_function = false;
M_.state_var = [1 2 5 9 ];
M_.exo_names_orig_ord = [1:2];
M_.maximum_lag = 1;
M_.maximum_lead = 1;
M_.maximum_endo_lag = 1;
M_.maximum_endo_lead = 1;
oo_.steady_state = zeros(12, 1);
M_.maximum_exo_lag = 0;
M_.maximum_exo_lead = 0;
oo_.exo_steady_state = zeros(2, 1);
M_.params = NaN(29, 1);
M_.endo_trends = struct('deflator', cell(12, 1), 'log_deflator', cell(12, 1), 'growth_factor', cell(12, 1), 'log_growth_factor', cell(12, 1));
M_.NNZDerivatives = [40; 0; -1; ];
M_.static_tmp_nbr = [3; 0; 0; 0; ];
M_.model_local_variables_static_tt_idxs = {
};
M_.params(3) = 0.36;
ALPHA = M_.params(3);
M_.params(7) = 0.1980123;
DELTA = M_.params(7);
M_.params(4) = 0.9182917;
BETA = M_.params(4);
M_.params(5) = 1;
ETA = M_.params(5);
M_.params(16) = 1.97882526;
THETA = M_.params(16);
M_.params(17) = 2.7989716673;
PHI = M_.params(17);
M_.params(18) = 0;
phi = M_.params(18);
M_.params(1) = 0.975;
A = M_.params(1);
M_.params(2) = 2.988090;
B = M_.params(2);
M_.params(19) = 0.3333333333333333;
NSS = M_.params(19);
M_.params(20) = 1/M_.params(3)*(1/M_.params(4)-1+M_.params(7));
YK = M_.params(20);
M_.params(21) = M_.params(20)-M_.params(7);
CK = M_.params(21);
M_.params(22) = M_.params(20)^(1/(1-M_.params(3)));
NKSS = M_.params(22);
M_.params(23) = M_.params(19)/M_.params(22);
KSS = M_.params(23);
M_.params(24) = M_.params(21)*M_.params(23);
CSS = M_.params(24);
M_.params(25) = 1/M_.params(4);
RSS = M_.params(25);
M_.params(26) = M_.params(25)*M_.params(16)-1;
ISS = M_.params(26);
M_.params(27) = M_.params(24)*(M_.params(1)*M_.params(26)/((1-M_.params(1))*(1+M_.params(26))))^((-1)/M_.params(2));
MSS = M_.params(27);
M_.params(28) = M_.params(1)*M_.params(24)^(1-M_.params(2))+(1-M_.params(1))*M_.params(27)^(1-M_.params(2));
XSS = M_.params(28);
M_.params(29) = M_.params(3)+M_.params(19)*M_.params(5)/(1-M_.params(19))+M_.params(20)*M_.params(3)*(1-M_.params(3));
RR = M_.params(29);
M_.params(8) = M_.params(1)*M_.params(24)^(1-M_.params(2))/M_.params(28);
GAMMA = M_.params(8);
M_.params(9) = (M_.params(2)-M_.params(17))*M_.params(8)-M_.params(2);
OMEGA1 = M_.params(9);
M_.params(10) = (M_.params(2)-M_.params(17))*(1-M_.params(8));
OMEGA2 = M_.params(10);
M_.params(11) = 0.34;
SIGMA_Z = M_.params(11);
M_.params(14) = 0.95;
RHOZ = M_.params(14);
M_.params(15) = 0.67;
RHOU = M_.params(15);
M_.params(12) = .95;
SIGMA_M = M_.params(12);
M_.params(13) = ((1-M_.params(15)^2)*M_.params(12)^2-M_.params(18)^2/(1-M_.params(14)^2)*M_.params(11)^2)^.5;
SIGMA_V = M_.params(13);
steady;
oo_.dr.eigval = check(M_,options_,oo_);
%
% SHOCKS instructions
%
M_.exo_det_length = 0;
M_.Sigma_e(1, 1) = (M_.params(11))^2;
M_.Sigma_e(2, 2) = (M_.params(13))^2;
options_.irf = 300;
var_list_ = {};
[info, oo_, options_, M_] = stoch_simul(M_, options_, oo_, var_list_);
save('miu_dynare_3e_152812_results.mat', 'oo_', 'M_', 'options_');
if exist('estim_params_', 'var') == 1
  save('miu_dynare_3e_152812_results.mat', 'estim_params_', '-append');
end
if exist('bayestopt_', 'var') == 1
  save('miu_dynare_3e_152812_results.mat', 'bayestopt_', '-append');
end
if exist('dataset_', 'var') == 1
  save('miu_dynare_3e_152812_results.mat', 'dataset_', '-append');
end
if exist('estimation_info', 'var') == 1
  save('miu_dynare_3e_152812_results.mat', 'estimation_info', '-append');
end
if exist('dataset_info', 'var') == 1
  save('miu_dynare_3e_152812_results.mat', 'dataset_info', '-append');
end
if exist('oo_recursive_', 'var') == 1
  save('miu_dynare_3e_152812_results.mat', 'oo_recursive_', '-append');
end


disp(['Total computing time : ' dynsec2hms(toc(tic0)) ]);
if ~isempty(lastwarn)
  disp('Note: warning(s) encountered in MATLAB/Octave code')
end
diary off
