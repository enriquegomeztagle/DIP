%% 
close all; clearvars; clc;

%%
img = rgb2gray(imread('buho.png'));
%%
figure; imshow(img); title('Original Image');
img2 = img .* 2;
figure; imshow(img2); title('Image .* 2');
img50 = img .* 50;
figure; imshow(img50); title('Image .* 50');

%% 
h1=fspecial('gaussian',3,5);
% figure; plot(h1); title('Gaussian');
h2=fspecial('gaussian',3,0.5);
hr = h1 - h2;
imLOG = imfilter(img,hr);
figure(); imshow(imLOG,[]);

% CON UN FILTRO REALZA EL BORDES DE LA IMAGEN
% El detector LoG (Laplacian of Gaussian) primero genera un versión
% desenfocada de la imagen a diferentes escalas (differentes niveles
% de desenfoque variando σ).

% El operador laplaciano detecta los bordes a las diferentes escalas
% obtenidas por la gaussiana.

% El detector LoG detecta bajo los mismos principios que la 2da
% derivada, es decir, detecta cambios de signo, cruces por cero y
% las magnitud de cambios de intensidad (bordes).

%%
% LOG
imgLog = edge(img,'log');
figure; imshow(imgLog, []); title('LoG');

%%
% CANNY
imgCanny = edge(img,'canny');
figure; imshow(imgCanny, []); title('Canny');

%% 
% CANNY with Thresholds and sigma
imgCanny2 = edge(img,'canny',0.2,6);
figure; imshow(imgCanny2, []); title('Canny with Thresholds and sigma');
