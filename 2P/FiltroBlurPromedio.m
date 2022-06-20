% El filtro promedio usa convolución (*) para aplicar el filtro a una
% imagen. BOX FILTER

% filtro promedio --> matriz de 1 tamaño impar
clc; clearvars; close all;

img=double(rgb2gray(imread('jc.png')));
figure(1);imshow(uint8(img)); title('Imagen original');

% imFiltered_average = imfilter(im,kernel).
% % im es una imagen en escala de grises y kernel es la matriz
% kernel

% kernel = matriz kernel con M pixeles de tamaño n × n, donde n
% es un número impar.
% Create a ones matrix
n=3;
k = ones(n);
k = k/n.^2;

imF=imfilter(img,k);
figure(2); imshow(imF,[]); title('Imagen filtrada 3x3');

% ¿Qué pasa si la ventana crece?, conforme el tamano de la ventana crece, se ve más borroso
% ¿Es posible tener ventanas de tamaño par? para el kernel, n siempre es impar

n2=7;
k2 = ones(n2);
k2 = k2/n2.^2;

imF2=imfilter(img,k2);
figure(3); imshow(imF2,[]); title('Imagen filtrada 7x7');

n3=11;
k3 = ones(n3);
k3 = k3/n3.^2;

imF3=imfilter(img,k3);
figure(4); imshow(imF3,[]); title('Imagen filtrada 11x11');

% convolución implica matriz cuadrada impar (kernel), sliding window y producto punto
% valores de kernel indican que tipo de filtro

