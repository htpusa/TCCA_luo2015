function isPD = checkEpsilon(K,epsilon)

% check if given epsilon results in a positive definite matrix

isPD = ones(numel(epsilon),1);
for ie=1:numel(epsilon)
    tmp = 1;
    for m = 1:numel(K)
        gm = K{m} * K{m} / (size(K{m},1)-1);
        gm = gm + epsilon(ie)*K{m};
        d = eig(gm);
        tmp = tmp & all(d > 0);
    end
    isPD(ie) = tmp;
end