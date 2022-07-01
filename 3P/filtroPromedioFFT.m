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
[filas,cols] = size(imFFTShift);

%% Creando el filtro promedio y transformandolo al dominio de la frecuencia
promedioKernel = ones(11)/(11 * 11); %Kernel promedio 3x3
fftPromedio = fft2(promedioKernel, filas, cols); 
promedioShift = fftshift(fftPromedio);

figure(); imshow(log(abs(promedioShift)),[]); title('Espectro de Fourier del filtro promedio')
figure(); surf(abs(promedioShift),'edgecolor','none'); 

%% Aplicando ambas m�scaras al espectro de Fourier FFT-Shift

filtPomedioFFTIm = imFFTShift .* promedioShift; %Una convoluci�n en el espacio es una multiplicaci�n en la frecuencia

figure(); imshow(log(abs(filtPomedioFFTIm)),[]); title('Resultado del Filtro promedio en la frecuencia')

%% Inversa de Fourier para regresar la imagen al espacio

% De la frecuencia al espacio
invImFFTShift = ifftshift(filtPomedioFFTIm); %Unshifting the FFT
invImFFT = abs(ifft2(invImFFTShift));
figure(); imshow(abs(invImFFT), []);  title('Imagen Filtrada')
