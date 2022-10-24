% %% 
% close all; clear; clc;
% 
% %% LOAD IMAGE
% img = imread('beluga.jpeg');
% figure(1); imshow(img); title('Original')
% gray = double(rgb2gray(img));
% 
% %% SPLITTING THE IMAGE INTO 3 CHANNELS
% R = img(:,:,1);
% G = img(:,:,2);
% B = img(:,:,3);
% 
% %% CREATE A ONLY RED CHANNEL IMAGE
% red = cat(3,R,zeros(size(R)),zeros(size(R)));
% figure(2); imshow(red);  title('Red')
% 
% %% CREATE A ONLY GREEN CHANNEL IMAGE
% green = cat(3,zeros(size(G)),G,zeros(size(G)));
% figure(3); imshow(green); title('Green');
% 
% %% CREATE A ONLY BLUE CHANNEL IMAGE
% blue = cat(3,zeros(size(B)),zeros(size(B)),B);
% figure(4); imshow(blue); title('Blue');
% 
% %% Obtén la transformada de Fourier de cada canal RGB de la imagen a color
% % y muestra el resultado en una figura.
% 
% % GENERATE DOUBLE & AND RGB2GRAY
% red = double(rgb2gray(red));
% green = double(rgb2gray(green));
% blue = double(rgb2gray(blue));
% 
% %% Fourier transform
% red = fft2(red);
% green = fft2(green);
% blue = fft2(blue);
% 
% %% MIN & MAX - LOG-ABS 
% min_red_fourier = min(red(:));
% min_green_fourier = min(green(:));
% min_blue_fourier = min(blue(:));
% 
% max_red_fourier = max(red(:));
% max_green_fourier = max(green(:));
% max_blue_fourier = max(blue(:));
% 
% abs_red_fourier = abs(red(:));
% abs_green_fourier = abs(green(:));
% abs_blue_fourier = abs(blue(:));
% 
% log_abs_red_fourier = log(abs_red_fourier);
% log_abs_green_fourier = log(abs_green_fourier);
% log_abs_blue_fourier = log(abs_blue_fourier);
% 
% min_log_abs_red_fourier = min(log_abs_red_fourier(:));
% min_log_abs_green_fourier = min(log_abs_green_fourier(:));
% min_log_abs_blue_fourier = min(log_abs_blue_fourier(:));
% 
% max_log_abs_red_fourier = max(log_abs_red_fourier(:));
% max_log_abs_green_fourier = max(log_abs_green_fourier(:));
% max_log_abs_blue_fourier = max(log_abs_blue_fourier(:));
% 
% %% SHIFT
% shift_log_abs_red_fourier = fftshift(log_abs_red_fourier);
% shift_log_abs_green_fourier = fftshift(log_abs_green_fourier);
% shift_log_abs_blue_fourier = fftshift(log_abs_blue_fourier);
% 
% %% Fourier transform
% red = fft2(red);
% green = fft2(green);
% blue = fft2(blue);
% 
% figure(5); imshow(red); title('Red Fourier');
% figure(6); imshow(green); title('Green Fourier');
% figure(7); imshow(blue); title('Blue Fourier');
% 
% %% Usando uno de los tres espectros de Fourier como referencia, genera una 
% % máscara cuyos valores cero se posicionen en valores importantes de alta frecuencia
% % en el espectro. Utiliza algún editor de imagen como: Photoshop, GIMP, Photopea, etc.
% 
% % A) CREATE MASK WITH VALUES 0 IN THE IMPORTANT INFO
% mask = ones(size(gray));
% for i = 1:size(gray,1)
%     for j = 1:size(gray,2)
%         if gray(i,j) > 0.5
%             mask(i,j) = 0;
%         end
%     end
% end
% 
% % A.1) APPLY MASK TO THE GRAY IMAGE
% gray = gray .* mask;
% figure(); imshow(gray); title('Gray with mask');
% 
% % B) APPLY MASK TO THE FOURIER IMAGE
% for i = 1:size(gray,1)
%     for j = 1:size(gray,2)
%         if gray(i,j) < 0.5
%             red(i,j) = 0;
%             green(i,j) = 0;
%             blue(i,j) = 0;
%         end
%     end
% end
% 
% % Recupera la imagen filtrada
% %% APPLY INVERSE FOURIER TRANSFORM TO EACH CHANNEL IMAGE
% red = ifft2(red);
% green = ifft2(green);
% blue = ifft2(blue);
% 
% %% RECONSTRUCT THE IMAGE WITH THE 3 CHANNELS
% for j = 1:size(gray,2)
%     for i = 1:size(gray,1)
%         img(i,j,1) = red(i,j);
%         img(i,j,2) = green(i,j);
%         img(i,j,3) = blue(i,j);
%     end
% end
% 
% %% SHOW FINAL IMAGE
% figure(); imshow(img); title("IMAGEN FINAL");
