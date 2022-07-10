%Color segmentation using HSV 
clc;
clearvars; close all;

im= imread('bouquet.jpg');
imHSV=rgb2hsv(im);
figure(); imshow(im);  title('Original image');
figure(); imshow(imHSV);  title('HSV image');

sigma = 5;
imHSV = imgaussfilt(imHSV, sigma, 'FilterSize', 3);
figure(); imshow(imHSV);  title('HSV image filtrada');

H = imHSV(:,:,1)*360;
S = imHSV(:,:,2);
V = imHSV(:,:,3);

Hmin = 270; Hmax = 330; %magenta
Smin = 0.1; Smax = 1;
Vmin = 0.1; Vmax = 1;

maskSV  = (S >= Smin) & (S <= Smax)&(V >= Vmin)&(V <= Vmax);
figure(); imshow(maskSV); title('Mask SV (Segmentación)'); 

mask = ((H > Hmin) & (H <= Hmax)) & (maskSV == 1);
mask3Ch = cat(3, mask, mask, mask);
figure(); imshow(mask); title('Mask H (Segmentación)'); 
%mask3Ch = cat(3, maskSV, maskSV, maskSV); %White color segmentation

colorFilter = im;
colorFilter(mask3Ch == 0) = 0; %colorFilter(mask3Ch ~= 0) = 0; %White color segmentation
figure(); imshow(colorFilter); title('Color Mask (Segmentación)'); 








%     
%     black = (valI<vThresh(1));
%     white = (satI<sThresh(1))&(valI>=vThresh(1));
%     red = ((hueI<=30)|(hueI>330))&threshI;
%     yellow = ((hueI>30)&(hueI<=90))&threshI;
%     green = ((hueI>90)&(hueI<=150))&threshI;
%     cyan = ((hueI>150)&(hueI<=210))&threshI;
%     blue = ((hueI>210)&(hueI<=270))&threshI;
%     magenta = ((hueI>270)&(hueI<=330))&threshI;
%     skin color
%lower = np.array([0, 48, 70], dtype = "uint8")
%upper = np.array([20, 255, 255], dtype = "uint8") 
