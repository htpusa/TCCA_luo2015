function [H, Z] = runTCCA(X,D,epsilon,varargin)

% [H, Z] = runTCCA(X,D,epsilon)
% [H, Z] = runTCCA(X,D,epsilon,cov_ten)

% convenience wrapper

if nargin>3
    cov_ten = tensor(varargin{1});
else
    cov_ten = [];
end

X = cellfun(@(Xm) Xm - mean(Xm,1),X,'UniformOutput',false);

[var_mats, cov_ten] = var_cov_ten_calculation(X,cov_ten);

para.nbV = numel(X);
para.rDim = D;
para.epsilon = epsilon;

[H Z] = TCCA(X,var_mats,cov_ten,para,para);