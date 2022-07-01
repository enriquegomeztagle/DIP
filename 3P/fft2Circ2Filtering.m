clearvars;
clc;
close all;

im = rgb2gray(imread('messi.jpg'));
figure(); imshow(im); title('Imagen Original')

%Obteniendo FFT en versi�n shift
imFFT = fft2(im);
imFFTShift = fftshift(imFFT);

%Para visualizaci�n
imFFT_SLA = (log(abs(imFFTShift)));
figure(); imshow(imFFT_SLA,[]); title('Espectro de Fourier Shift-Log-abs')

%% Creando la M�scara Circular
[rows, cols] = size(imFFT);
cX =round(cols/2); 
cY = round(rows/2); 
radio = round(rows/4);


mask1 = zeros(rows, cols); 
m = {cY, cX}; %Punto central
mask1(m{:})= 1; %mask1(cY,cX) = 1;
mask1 = bwdist(mask1) <= radio;
figure(); imshow(mask1); title('M�scara Circular 1');

mask2 = 1 - mask1;
figure(); imshow(mask2); title('M�scara Circular 2');

%% Aplicando ambas m�scaras al espectro de Fourier FFT-Shift

%Aplicando la m�scara a la versi�n FFT-shift de la imagen
imFFTShift_mask1 = imFFTShift; 
imFFTShift_mask1(mask1 == 0) = 0;  %Aplicando la m�scara
figure(); imshow(log(abs(imFFTShift_mask1)),[]); title('Bajas Frecuencia')

imFFTShift_mask2 = imFFTShift; 
imFFTShift_mask2(~mask2) = 0;
figure(); imshow(log(abs(imFFTShift_mask2)),[]); title('Altas Frecuencia')

%% Inversa de Fourier para regresar la imagen al espacio

% Procesando las frecuencias bajas
invImFFTShift = ifftshift(imFFTShift_mask1); %Unshifting the FFT
invImFFT = abs(ifft2(invImFFTShift));

minBound = min(abs(invImFFT(:)));
maxBound = max(abs(invImFFT(:)));
figure(); imshow(abs(invImFFT), [minBound maxBound]); title('Filtro Pasa bajas Frecuencias')

% Procesando las frecuencias altas
invImFFTH= abs(ifft2(ifftshift(imFFTShift_mask2))); %Unshifting the FFT
figure(); imshow(abs(invImFFTH), []);  title('Filtro Pasa Altas Frecuencias')

