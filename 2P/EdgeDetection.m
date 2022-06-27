clear; close all; clc;

% Edge detection sobel

img=rgb2gray(imread('up.png'));
img2=edge(img,'sobel');
figure,imshow(img), title('Original Image');
figure,imshow(img2), title('Edge detection sobel');
