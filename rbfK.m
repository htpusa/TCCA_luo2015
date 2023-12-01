function K = rbfK(X,sigma)

K = cell(numel(X),1);
for m=1:numel(X)
    K{m} = squareform(exp(-pdist(X{m}).^2/(2*sigma^2)));
end