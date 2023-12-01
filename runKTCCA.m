function [H, Z] = runKTCCA(X,D,epsilon,kernel,varargin)

% [H, Z]  = runTCCA(X,D,epsilon,kernel)
% [H, Z]  = runTCCA(X,D,epsilon,kernel,cov_gram_ten)

% convenience wrapper

if nargin>4
    cov_gram_ten = tensor(varargin{1});
else
    cov_gram_ten = [];
end

X = cellfun(@(Xm) Xm - mean(Xm,1),X,'UniformOutput',false);

switch kernel.type
    case "poly"
        K = polyK(X,kernel.degree,kernel.c);
    case "rbf"
        K = rbfK(X,kernel.sigma);
    case "paper"
        K = paperK(X);
end

[var_gram_mats, cov_gram_ten] = var_cov_gram_ten_calculation(K,cov_gram_ten);

para.nbV = numel(X);
para.rDim = D;
para.epsilon = epsilon;

[H, Z] = KTCCA(K, var_gram_mats, cov_gram_ten, para, para);