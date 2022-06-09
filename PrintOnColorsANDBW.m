% Load Image
A=imread('DavyJones_Light.jpg');
% Pop up window
figure(); imshow(A);

% Take each channel
R=A(:,:,1);
G=A(:,:,2);
B=A(:,:,3);

% Only 1 channel, B/W 
figure(); imshow(R);
%figure(); imshow(G);
%figure(); imshow(B);

% Comm matrix with 0s
Commodin = zeros(size(R));

% CAT(#CH,V,V,V), se llena el que quieres
% Chance to Red and show
rojo = cat(3,R,Commodin,Commodin);
figure(); imshow(rojo);

% Chance to Green and show
green = cat(3,Commodin,G,Commodin);
figure(); imshow(green);

% Chance to Blue and show
blue = cat(3,Commodin,Commodin,B);
figure(); imshow(blue);

% En gris
x = cat(3,G,G,G);
figure(); imshow(x);
