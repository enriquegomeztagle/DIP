clc; clear vars; close all;

im1=rgb2gray(imread("buho.png")); im2=rgb2gray(imread("cup.png"));

iHM = imhistmatch(im1, im2);

figure(); imshow(iHM);
figure(); imshow(im1);
figure(); imshow(im2);

figure(); h=histogram(im1); title("BUHO");
figure(); h=histogram(im2); title("CUP");
figure(); h=histogram(iHM); title("MATCHED");
