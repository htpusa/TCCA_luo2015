function [H, Z] = runTCCA(X,D,epsilon)

% convenience wrapper

X = cellfun(@(Xm) Xm - mean(Xm,1),X,'UniformOutput',false);

[var_mats, cov_ten] = var_cov_ten_calculation(X);

para.nbV = numel(X);
para.rDim = D;
para.epsilon = epsilon;

[H Z] = TCCA(X,var_mats,cov_ten,para,para);