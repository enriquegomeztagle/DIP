% El filtro promedio usa convolución (*) para aplicar el filtro a una
% imagen. BOX FILTER

% filtro promedio --> matriz de 1 tamaño impar
clc; clearvars; close all;

img=double(rgb2gray(imread('jc.png')));
figure(1);imshow(uint8(img)); title('Imagen original');

% Create a ones matrix
n=3;
k = ones(n);
k = k/n.^2;

imF=imfilter(img,k);
figure(2); imshow(imF,[]);

n2=7;
k2 = ones(n2);
k2 = k2/n2.^2;

imF2=imfilter(img,k2);
figure(3); imshow(imF2,[]);

n3=11;
k3 = ones(n3);
k3 = k3/n3.^2;

imF3=imfilter(img,k3);
figure(4); imshow(imF3,[]);


