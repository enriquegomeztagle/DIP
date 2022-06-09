A = ones(8,6);

[ysize, xSize] = size(A);

A(1:ysize/2, 1:end) = 2;

A(ysize/2 + 1: end, xSize/2 +1: end) = 3;