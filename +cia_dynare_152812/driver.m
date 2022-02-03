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
M_.fname = 'cia_dynare_152812';
M_.dynare_version = '4.6.3';
oo_.dynare_version = '4.6.3';
options_.dynare_version = '4.6.3';
%
% Some global variables initialization
%
global_initialization;
diary off;
diary('cia_dynare_152812.log');
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
M_.endo_names(1) = {'Y'};
M_.endo_names_tex(1) = {'Y'};
M_.endo_names_long(1) = {'Y'};
M_.endo_names(2) = {'K'};
M_.endo_names_tex(2) = {'K'};
M_.endo_names_long(2) = {'K'};
M_.endo_names(3) = {'N'};
M_.endo_names_tex(3) = {'N'};
M_.endo_names_long(3) = {'N'};
M_.endo_names(4) = {'C'};
M_.endo_names_tex(4) = {'C'};
M_.endo_names_long(4) = {'C'};
M_.endo_names(5) = {'INV'};
M_.endo_names_tex(5) = {'INV'};
M_.endo_names_long(5) = {'INV'};
M_.endo_names(6) = {'MUY'};
M_.endo_names_tex(6) = {'MUY'};
M_.endo_names_long(6) = {'MUY'};
M_.endo_names(7) = {'R'};
M_.endo_names_tex(7) = {'R'};
M_.endo_names_long(7) = {'R'};
M_.endo_names(8) = {'I'};
M_.endo_names_tex(8) = {'I'};
M_.endo_names_long(8) = {'I'};
M_.endo_names(9) = {'PI'};
M_.endo_names_tex(9) = {'PI'};
M_.endo_names_long(9) = {'PI'};
M_.endo_names(10) = {'M'};
M_.endo_names_tex(10) = {'M'};
M_.endo_names_long(10) = {'M'};
M_.endo_names(11) = {'U'};
M_.endo_names_tex(11) = {'U'};
M_.endo_names_long(11) = {'U'};
M_.endo_names(12) = {'Z'};
M_.endo_names_tex(12) = {'Z'};
M_.endo_names_long(12) = {'Z'};
M_.endo_partitions = struct();
M_.param_names = cell(19,1);
M_.param_names_tex = cell(19,1);
M_.param_names_long = cell(19,1);
M_.param_names(1) = {'ALPHA'};
M_.param_names_tex(1) = {'ALPHA'};
M_.param_names_long(1) = {'ALPHA'};
M_.param_names(2) = {'BETA'};
M_.param_names_tex(2) = {'BETA'};
M_.param_names_long(2) = {'BETA'};
M_.param_names(3) = {'YK'};
M_.param_names_tex(3) = {'YK'};
M_.param_names_long(3) = {'YK'};
M_.param_names(4) = {'CK'};
M_.param_names_tex(4) = {'CK'};
M_.param_names_long(4) = {'CK'};
M_.param_names(5) = {'RSS'};
M_.param_names_tex(5) = {'RSS'};
M_.param_names_long(5) = {'RSS'};
M_.param_names(6) = {'DELTA'};
M_.param_names_tex(6) = {'DELTA'};
M_.param_names_long(6) = {'DELTA'};
M_.param_names(7) = {'ETA'};
M_.param_names_tex(7) = {'ETA'};
M_.param_names_long(7) = {'ETA'};
M_.param_names(8) = {'B'};
M_.param_names_tex(8) = {'B'};
M_.param_names_long(8) = {'B'};
M_.param_names(9) = {'ISS'};
M_.param_names_tex(9) = {'ISS'};
M_.param_names_long(9) = {'ISS'};
M_.param_names(10) = {'RHOZ'};
M_.param_names_tex(10) = {'RHOZ'};
M_.param_names_long(10) = {'RHOZ'};
M_.param_names(11) = {'RHOU'};
M_.param_names_tex(11) = {'RHOU'};
M_.param_names_long(11) = {'RHOU'};
M_.param_names(12) = {'THETA'};
M_.param_names_tex(12) = {'THETA'};
M_.param_names_long(12) = {'THETA'};
M_.param_names(13) = {'PHI'};
M_.param_names_tex(13) = {'PHI'};
M_.param_names_long(13) = {'PHI'};
M_.param_names(14) = {'phi'};
M_.param_names_tex(14) = {'phi'};
M_.param_names_long(14) = {'phi'};
M_.param_names(15) = {'PSI'};
M_.param_names_tex(15) = {'PSI'};
M_.param_names_long(15) = {'PSI'};
M_.param_names(16) = {'NSS'};
M_.param_names_tex(16) = {'NSS'};
M_.param_names_long(16) = {'NSS'};
M_.param_names(17) = {'SIGMA_U'};
M_.param_names_tex(17) = {'SIGMA\_U'};
M_.param_names_long(17) = {'SIGMA_U'};
M_.param_names(18) = {'SIGMA_Z'};
M_.param_names_tex(18) = {'SIGMA\_Z'};
M_.param_names_long(18) = {'SIGMA_Z'};
M_.param_names(19) = {'SIGMA_M'};
M_.param_names_tex(19) = {'SIGMA\_M'};
M_.param_names_long(19) = {'SIGMA_M'};
M_.param_partitions = struct();
M_.exo_det_nbr = 0;
M_.exo_nbr = 2;
M_.endo_nbr = 12;
M_.param_nbr = 19;
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
 0 5 17;
 1 6 0;
 0 7 0;
 0 8 0;
 0 9 0;
 0 10 18;
 0 11 0;
 0 12 0;
 0 13 19;
 2 14 0;
 3 15 0;
 4 16 0;]';
M_.nstatic = 5;
M_.nfwrd   = 3;
M_.npred   = 4;
M_.nboth   = 0;
M_.nsfwrd   = 3;
M_.nspred   = 4;
M_.ndynamic   = 7;
M_.dynamic_tmp_nbr = [0; 0; 0; 0; ];
M_.model_local_variables_dynamic_tt_idxs = {
};
M_.equations_tags = {
  1 , 'name' , 'Z' ;
  2 , 'name' , 'U' ;
  3 , 'name' , 'Y' ;
  4 , 'name' , '4' ;
  5 , 'name' , 'K' ;
  6 , 'name' , 'R' ;
  7 , 'name' , '7' ;
  8 , 'name' , 'MUY' ;
  9 , 'name' , '9' ;
  10 , 'name' , 'M' ;
  11 , 'name' , '11' ;
  12 , 'name' , 'I' ;
};
M_.mapping.Y.eqidx = [3 4 6 7 ];
M_.mapping.K.eqidx = [3 5 6 ];
M_.mapping.N.eqidx = [3 7 ];
M_.mapping.C.eqidx = [4 9 10 ];
M_.mapping.INV.eqidx = [4 5 ];
M_.mapping.MUY.eqidx = [7 8 9 ];
M_.mapping.R.eqidx = [6 8 12 ];
M_.mapping.I.eqidx = [9 12 ];
M_.mapping.PI.eqidx = [11 12 ];
M_.mapping.M.eqidx = [10 11 ];
M_.mapping.U.eqidx = [2 11 ];
M_.mapping.Z.eqidx = [1 2 3 ];
M_.mapping.EPZ.eqidx = [1 ];
M_.mapping.EPU.eqidx = [2 ];
M_.static_and_dynamic_models_differ = false;
M_.has_external_function = false;
M_.state_var = [2 10 11 12 ];
M_.exo_names_orig_ord = [1:2];
M_.maximum_lag = 1;
M_.maximum_lead = 1;
M_.maximum_endo_lag = 1;
M_.maximum_endo_lead = 1;
oo_.steady_state = zeros(12, 1);
M_.maximum_exo_lag = 0;
M_.maximum_exo_lead = 0;
oo_.exo_steady_state = zeros(2, 1);
M_.params = NaN(19, 1);
M_.endo_trends = struct('deflator', cell(12, 1), 'log_deflator', cell(12, 1), 'growth_factor', cell(12, 1), 'log_growth_factor', cell(12, 1));
M_.NNZDerivatives = [38; 0; -1; ];
M_.static_tmp_nbr = [0; 0; 0; 0; ];
M_.model_local_variables_static_tt_idxs = {
};
M_.params(1) = 0.36;
ALPHA = M_.params(1);
M_.params(6) = 0.019;
DELTA = M_.params(6);
M_.params(2) = 0.989;
BETA = M_.params(2);
M_.params(7) = 1;
ETA = M_.params(7);
M_.params(12) = 1.0138;
THETA = M_.params(12);
SIGMA = 1;
M_.params(13) = 2;
PHI = M_.params(13);
M_.params(15) = 0.75;
PSI = M_.params(15);
M_.params(8) = 9;
B = M_.params(8);
M_.params(14) = 0;
phi = M_.params(14);
M_.params(3) = 1/M_.params(1)*(1/M_.params(2)-1+M_.params(6));
YK = M_.params(3);
M_.params(4) = M_.params(3)-M_.params(6);
CK = M_.params(4);
M_.params(5) = 1/M_.params(2);
RSS = M_.params(5);
M_.params(9) = M_.params(5)*M_.params(12);
ISS = M_.params(9);
M_.params(16) = 0.3333333333333333;
NSS = M_.params(16);
M_.params(10) = 0.9;
RHOZ = M_.params(10);
M_.params(11) = 0.67;
RHOU = M_.params(11);
M_.params(18) = 0.34;
SIGMA_Z = M_.params(18);
M_.params(19) = 1.17;
SIGMA_M = M_.params(19);
M_.params(17) = ((1-M_.params(11)^2)*M_.params(19)^2-M_.params(14)^2/(1-M_.params(10)^2)*M_.params(18)^2)^.5;
SIGMA_U = M_.params(17);
steady;
oo_.dr.eigval = check(M_,options_,oo_);
%
% SHOCKS instructions
%
M_.exo_det_length = 0;
M_.Sigma_e(1, 1) = (M_.params(18))^2;
M_.Sigma_e(2, 2) = (M_.params(17))^2;
options_.ar = 1;
options_.irf = 60;
options_.nograph = true;
options_.noprint = false;
options_.order = 1;
var_list_ = {};
[info, oo_, options_, M_] = stoch_simul(M_, options_, oo_, var_list_);
OOPT.MODELS.CIA1 =   oo_;
save OOPT_CIA1;
M_.params(14) = (-0.5);
phi = M_.params(14);
options_.ar = 1;
options_.irf = 60;
options_.nograph = true;
options_.noprint = false;
options_.order = 1;
var_list_ = {};
[info, oo_, options_, M_] = stoch_simul(M_, options_, oo_, var_list_);
OOPT.MODELS.CIA2 =   oo_;
save OOPT_CIA2;
M_.params(14) = 0.5;
phi = M_.params(14);
options_.ar = 1;
options_.irf = 60;
options_.nograph = true;
options_.noprint = false;
options_.order = 1;
var_list_ = {};
[info, oo_, options_, M_] = stoch_simul(M_, options_, oo_, var_list_);
OOPT.MODELS.CIA3 =   oo_;
save OOPT_CIA3;
M_.params(11) = 0.9;
RHOU = M_.params(11);
M_.params(14) = 0;
phi = M_.params(14);
options_.ar = 1;
options_.irf = 60;
options_.nograph = true;
options_.noprint = true;
options_.order = 1;
var_list_ = {};
[info, oo_, options_, M_] = stoch_simul(M_, options_, oo_, var_list_);
OOPT.MODELS.CIA4 =   oo_;
save OOPT_CIA4;
OOPT.NN=40;
OOPT.plot_color={'k' 'b:' 'r-.'};
OOPT.shocks_names={'EPZ'};
OOPT.tit_shocks={'Choque a productividad'};
OOPT.type_models={'CIA2' 'CIA1' 'CIA3'};
OOPT.legend_models={'\phi = -0.5' '\phi = 0' '\phi = 0.5'};
OOPT.list_endo={'Y' 'N' 'R' 'I' 'PI' 'M'};
OOPT.label_variables={'Produccion' 'Empleo' 'TasaInteresreal' 'TasInteresNominal' 'TasaInflacion' 'Oferta Monetaria Real'};
plot_comp(OOPT);
print -depsc2 'Figure2.a'
OOPT.NN=40;
OOPT.plot_color={'b' 'r:'};
OOPT.shocks_names={'EPU'};
OOPT.tit_shocks={'Choque por politica'};
OOPT.type_models={'CIA1' 'CIA4'};
OOPT.legend_models={'\rho_u = 0.67' '\rho_u = 0.9'};
OOPT.list_endo={'Y' 'N' 'R' 'I' 'PI' 'M'};
OOPT.label_variables={'Produccion' 'Empleo' 'TasaInteresreal' 'TasInteresNominal' 'TasaInflacion' 'Oferta Monetaria Real'};
plot_comp(OOPT);
print -depsc2 'Figure1.a'
OOPT.NN=12;
OOPT.plot_color={'o-b' 'd-k'};
OOPT.shocks_names={'EPZ'};
OOPT.tit_shocks={'Choque a productividad'};
OOPT.type_models={'CIA1' 'CIA2'};
OOPT.legend_models={'\phi = 3.0' '\phi = -3.0'};
OOPT.list_endo={'Y' 'C' 'INV' 'K' 'N' 'R' 'I' 'PI' 'Z'};
OOPT.label_variables={'Produccion' 'Consumo' 'Inversion' 'Capital' 'Empleo' 'tasa Interes real' 'tasa Interes Nominal' 'tasa inflacion' 'Choque a productividad'};
plot_comp(OOPT);
print -depsc2 'Figure 1'
OOPT.NN=12;
OOPT.plot_color={'o-b' 'd-k'};
OOPT.shocks_names={'EPU'};
OOPT.tit_shocks={'Choque por politica'};
OOPT.type_models={'CIA1' 'CIA3'};
OOPT.legend_models={'\rho_u = 0.67' '\rho_u = 0.9'};
OOPT.list_endo={'Y' 'C' 'INV' 'K' 'N' 'R' 'I' 'PI' 'U'};
OOPT.label_variables={'Produccion' 'Consumo' 'Inversion' 'Capital' 'Empleo' 'TasaInteresReal' 'TasaInteresNominal' 'TasaInflacion' 'Dinero'};
plot_comp(OOPT);
print -depsc2 'Figure 2'
save('cia_dynare_152812_results.mat', 'oo_', 'M_', 'options_');
if exist('estim_params_', 'var') == 1
  save('cia_dynare_152812_results.mat', 'estim_params_', '-append');
end
if exist('bayestopt_', 'var') == 1
  save('cia_dynare_152812_results.mat', 'bayestopt_', '-append');
end
if exist('dataset_', 'var') == 1
  save('cia_dynare_152812_results.mat', 'dataset_', '-append');
end
if exist('estimation_info', 'var') == 1
  save('cia_dynare_152812_results.mat', 'estimation_info', '-append');
end
if exist('dataset_info', 'var') == 1
  save('cia_dynare_152812_results.mat', 'dataset_info', '-append');
end
if exist('oo_recursive_', 'var') == 1
  save('cia_dynare_152812_results.mat', 'oo_recursive_', '-append');
end


disp(['Total computing time : ' dynsec2hms(toc(tic0)) ]);
if ~isempty(lastwarn)
  disp('Note: warning(s) encountered in MATLAB/Octave code')
end
diary off
