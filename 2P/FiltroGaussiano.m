clc; clear; close all;

% % σ = desviación

% sigma=2;
% kernelSize=29;

% gF = fspecial('gaussian', kernelSize, sigma);

% figure(); surf(gF); title('gaussian, 29K, 2σ')

% figure(); contourf(gF,'LineStyle','none'); title('gaussian, 29K, 2σ')

% sigma2=5;
% kernelSize2=29;

% gF2 = fspecial('gaussian', kernelSize2, sigma2);

% figure(); surf(gF2); title('gaussian, 29K, 5σ')

% figure(); contourf(gF2,'LineStyle','none'); title('gaussian, 29K, 5σ')

% sigmaMax=50;
% kernelSizeMax=50;

% gFMax = fspecial('gaussian', kernelSizeMax, sigmaMax);

% figure(); surf(gFMax); title('gaussian, 50K, 50σ')

% figure(); contourf(gFMax,'LineStyle','none'); title('gaussian, 50K, 50σ')


%%%%%%%%%%%%%%%%%%%%%%%

im=imread('up.png');
im=rgb2gray(im);
im=double(im);
sigma = 5;

imFiltered_gaussian = imgaussfilt(im,sigma)
imFiltered_gaussian=uint8(imFiltered_gaussian);

% En Matlab el tamaño de ventana por default con la función imgaussfilt es: 2 ∗ 2σ + 1

figure(); imshow(imFiltered_gaussian); title('imFiltered_gaussian')
