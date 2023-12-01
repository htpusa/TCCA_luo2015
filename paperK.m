function K = paperK(X)

% kernel from the paper

K = cell(numel(X),1);
for m=1:numel(X)
    d = pdist(X{m});
    l = -max(d)^(-1);
    K{m} = squareform(exp(l*d));
end