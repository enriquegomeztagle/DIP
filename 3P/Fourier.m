close all; clear; clc;
%%
img=imread('messi.jpg');
figure; imshow(img); title('Original Image');
GS=rgb2gray(img);
doubleGS=double(GS);

% imFFT = fft2(imGray); figure(); imshow(imFFT);
% Transformada de Fourier, del espacio al dominio de la frecuencia
imFFT = fft2(doubleGS); figure(); imshow(imFFT); title('Transformada de Fourier');

% invGray = ifft2(imFFT); figure(); imshow(uint8(invGray));
% Transformada de inversa Fourier, del dominio de la frecuencia al espacio
invFFT = ifft2(imFFT); figure(); imshow(invFFT); title('Transformada de inversa Fourier');

% Conservemos solo los valores reales
absFFT = abs(imFFT);

% La diferencia entre los valores máximos y mínimos en el espectro
% de Fourier es muy grande. Para minimizar dicha diferencia se
% utiliza la escala logarítmica (logaritmo natural) en vez de la escala lineal. 
logFFT = log(absFFT);
figure(); imshow(uint8(logFFT),[]); title('Transformada de Fourier con escala logarítmica');

% Crear histogramas para imagenes antes y después del log
hist(absFFT);
hist(logFFT);

% La versión logFFT = log(absFFT); del espectro de Fourier
% suele contener valores muy altos en las esquinas (color claro) y
% valores bajos (color obscuro) en el centro de la imagen. Para
% procesar los valores altos en esta representación tendríamos que
% hacer un proceso para cada cuadrante. Por lo que resultaría más
% conveniente concentrar todos los valores altos en el centro
% imshow(fftshift(log(abs(fft2(Grayscale))))
shiftFFT = fftshift(logFFT);
figure();imshow(uint8(shiftFFT),[]);
