clc;
%clearvars; close all;

im= imread('bouquet.jpg');
imGray=rgb2gray(im);
figure(); imshow(imGray, []); title('Imagen Original');

dctIm = dct2(double(imGray));
figure(); imshow(log(dctIm)); title('DCT Image');
Th = 10;

dctIm(abs(dctIm) < Th) = 0;
figure(); imshow(log(dctIm)); title('DCT Image con perdida');
spatialIm = idct2(dctIm);

figure(); imshow(spatialIm, []);  title('Imagen de regreso al espacio con perdida');

imwrite('f1.png',spatialIm);