%Programa para obtener la transformada wavelet de 2-do nivel, eliminar los
%coeficientes inferiores a determinado umbral y regresar al espacio.
clc;
clearvars; close all;

im= imread('bouquet.jpg');
imGray=rgb2gray(im);
figure(); imshow(imGray);  title('Grayscale Original Image');

%% Wavelet decomposition
[xa, xh, xv, xd] = dwt2(imGray,'db2');
%LL,HL,LH,HH

figure(); title('First Decomposition 2D - DWT');
subplot(2,2,1); imshow(xa/255); title('LL');
subplot(2,2,2); imshow(xh); title('Horizontal: HL');
subplot(2,2,3); imshow(xv); title('Vertical: LH');
subplot(2,2,4); imshow(xd); title('Diagonal: HH');

X1 = [xa * 0.003,  log10(xv)*0.3; log10(xh)*0.3, log10(xd)*0.3];
figure(); imshow(X1);  title('1-level Decomposed Image');

%%
[xaa, xhh, xvv, xdd] = dwt2(xa, 'db2'); %Decomposición de 2do Nivel a la banda LL
%ver help wfilters para más filtros

figure(); title('2nd Decomposition 2D- DWT');
subplot(2,2,1); imshow(xaa/255); title('LL2');
subplot(2,2,2); imshow(xhh); title('Horizontal: HL2');
subplot(2,2,3); imshow(xvv); title('Vertical: LH2');
subplot(2,2,4); imshow(xdd); title('Diagonal: HH2');

X11 = [xaa * 0.001,  log10(xvv)*0.3; log10(xhh)*0.3, log10(xdd)*0.3];
figure(); imshow(X1);  title('2-level Decomposed Image');

X2 = [X11(1:end-3,1:end-3), log10(xv)*0.3; log10(xh)*0.3, log10(xd)*0.3];
figure(); imshow(X2);  title('2 & 1-level Decomposed Image');

%% Processing on Frequency
Th = 40;
xaa(abs(xaa) < Th) = 0;
figure(); imshow(xaa/255);  title('Procesado en la Frecuencia');
%% Frequency to Space

xaD = idwt2(xaa, xhh, xvv, xdd, 'db2');
figure(); imshow(xaD/255);  title('2  Recomposed Image');

xaDRec = idwt2(xaD(1:end-1,1:end-1), xh, xv, xd, 'db2');
figure(); imshow(xaDRec/255);  title('1  Recomposed Image');

