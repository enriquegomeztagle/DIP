% Utilizando la transformada de Fourier, filtra una foto obtenida por alguno de los siguientes métodos:

% La imagen debe contener un patrón de ruido provocado por el método de captura de imagen. El
% resultado es una imagen con el correspondiente ruido reducido significativamente.

%%
close all; clear all; clc;

% Pasos:
% 1. Obtén la fotografía
img = imread('beluga.jpeg');
% figure(1); imshow(img); title('Imagen original');

gray = double(rgb2gray(img));
% figure(2); imshow(gray, []); title('Imagen en escala de grises');

% 2) Obtén la transformada de Fourier de cada canal RGB de la imagen a color
R = img (:,:,1);
G = img (:,:,2);
B = img (:,:,3);

red_image = cat(3, R, zeros(size(R)), zeros(size(R)));
% figure(3); imshow(red_image); title('Imagen roja');

green_image = cat(3, zeros(size(G)), G, zeros(size(G)));
% figure(4); imshow(green_image); title('Imagen verde');

blue_image = cat(3, zeros(size(B)), zeros(size(B)), B);
% figure(5); imshow(blue_image); title('Imagen azul');

red_fourier = fft2(double(rgb2gray(red_image)));
% figure(6); imshow(log(abs(red_fourier)), []); title('Transformada de Fourier de la imagen roja');

green_fourier = fft2(double(rgb2gray(green_image)));
% figure(7); imshow(log(abs(green_fourier)), []); title('Transformada de Fourier de la imagen verde');

blue_fourier = fft2(double(rgb2gray(blue_image)));
% figure(8); imshow(log(abs(blue_fourier)), []); title('Transformada de Fourier de la imagen azul');

shifted_red = fftshift(red_fourier); 
% figure(9); imshow(log(abs(shifted_red)), []); title('Transformada de Fourier centrada de la imagen roja');

shifted_green = fftshift(green_fourier);
% figure(10); imshow(log(abs(shifted_green)), []); title('Transformada de Fourier centrada de la imagen verde');

shifted_blue = fftshift(blue_fourier);
% figure(11); imshow(log(abs(shifted_blue)), []); title('Transformada de Fourier centrada de la imagen azul');


% 3) 3. Usando uno de los tres espectros de Fourier como referencia, genera una máscara cuyos valores 
% cero se posicionen en valores importantes de alta frecuencia en el espectro. Utiliza algún editor de
% imagen como: Photoshop, GIMP, Photopea, etc.

fourier_filter = double(imread('filtro.png'));

% RESIZE TO SAME SIZE AS SHIFTED IMAGES
fourier_filter = imresize(fourier_filter, size(shifted_red));

% figure(12); imshow(fourier_filter); title('Imagen con Máscara');

% 5) Recupera la imagen filtrada
filtered_red = shifted_red .* fourier_filter;
% CHANGE TO ONE CHANNEL
filtered_red = filtered_red(:,:,1);
% figure(14); imshow(uint8(ifft2(filtered_red)), []); title('Imagen filtrada roja');

filtered_green = shifted_green .* fourier_filter;
% CHANGE TO ONE CHANNEL
filtered_green = filtered_green(:,:,2);
% figure(15); imshow(uint8(ifft2(filtered_green)), []); title('Imagen filtrada verde');

filtered_blue = shifted_blue .* fourier_filter;
% CHANGE TO ONE CHANNEL
filtered_blue = filtered_blue(:,:,3);
% figure(16); imshow(uint8(ifft2(filtered_blue)), []); title('Imagen filtrada azul');


% 6) Recupera la imagen original
filtered_image = cat(3, uint8(ifft2(filtered_red)), uint8(ifft2(filtered_green)), uint8(ifft2(filtered_blue)));

%% TODO REVISA LOS COLORES PARA AJUSTAR


%%
figure(17); imshow(filtered_image); title('Imagen filtrada');
