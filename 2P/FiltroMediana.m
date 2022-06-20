close all; clear; clc;

% Filtro de mediana no lleva conolución, y por lo tanto, no hay producto punto.
% Pero si usa sliding window

% 1) tomas pixeles sliding window
% 2) ordenas menor a mayor
% 3) tomas pixel central

% ¿Necesitamos definir la ventana como en el caso del filtro
% promedio? NO, porque los valores se toman de la original

% imFiltered_median = medfilt2(im,[n, n])

% n es el tamaño de kernel y es impar.

% ¿Qué pasa si la ventana crece?

% Visualmente, ¿cuál es la principal diferencia con el filtro
% promedio?

img = rgb2gray(imread('buho.png'));
figure(), imshow(img); title('Imagen original');

resMed=medfilt2(img,[3,3]);
figure(), imshow(resMed); title('Imagen filtrada mediana 3x3');

resMed2=medfilt2(img,[7,7]);
figure(), imshow(resMed2); title('Imagen filtrada mediana 7x7'); % Sobre texturas

k=ones(7)/49;
imProm=imfilter(double(img),k);
imProm=uint8(imProm);
figure(); imshow(imProm); title('Imagen filtrada promedio 7x7'); % Blur/Smooth en todo
