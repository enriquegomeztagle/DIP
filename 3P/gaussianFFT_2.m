clearvars;
close all;
clc;

%% Convertir imagen a la frecuencia
%Aplicando el filtro gaussiano a la imagen
im = rgb2gray(imread('landscape.jpg'));
imEscalada =imresize(im,[512, 512]);

fftImagen = fft2(imEscalada);
imagenShift = fftshift(fftImagen);
figure(); imshow(log(abs(imagenShift )),[]); title('Imagen en la Frecuencia FFT');

%% Crear Kernel Gaussiano y convertirlo a la frecuencia

%Gaussiana en el espacio
sigma  = 5;
gf = fspecial('gaussian', 512,5); %sigma = 5
gf = mat2gray(gf); %Para escalar gf a 1
figure(); imshow(log((gf)),[]); title('Gaussiana en el espacio');

%Del espacio a la frecuencia
fftGaussiana = fft2(gf, 512, 512);
gaussianaShift = fftshift(fftGaussiana);
figure(); imshow(log(abs(gaussianaShift )),[]); title('Gaussiana en la Frecuencia');

imagenFiltrada = imagenShift .* gaussianaShift; %Aplicando el filtro a la imagen (ambos estan en la frecuencia)

imagenFiltradaEspacio = ifftshift(ifft2(imagenFiltrada));
figure(); imshow(abs(imagenFiltradaEspacio),[]); title('Imagen Filtrada de regreso al espacio');


