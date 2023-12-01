function K = polyK(X,d,c)

K = cell(numel(X),1);
for m=1:numel(X)
    K{m} = (X{m}*X{m}' + c).^d;
end