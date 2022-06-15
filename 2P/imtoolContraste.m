RGB = imread('cup.png');
GS = rgb2gray(RGB);
figure(); imshow(GS);
% imtool(GS);

% Equalizar histograma
figure();imEq = histeq(GS);
imshow(imEq);

