% Codigo de etica: “Certifico que el trabajo realizado en este examen es estrictamente personal y reconozco
% que no cumplir las reglas o COMETER ACTOS DESHONESTOS en los ex´amenes puede resultar en la baja
% definitiva de la Universidad”.

% LOAD IMAGE AND EXTRACT CHANNELS AND SIZE
img=imread('ciudadUP.jpg');
R=img(:,:,1);
G=img(:,:,2);
B=img(:,:,3);
[rows, columns, numChannels] = size(R);

% Only changes center to BW, sides keep in color behind TS C
% R(1:rows,columns/3:2*columns/3,numChannels)=G(1:rows,columns/3:2*columns/3,numChannels);
% G(1:rows,columns/3:2*columns/3,numChannels)=G(1:rows,columns/3:2*columns/3,numChannels);
% B(1:rows,columns/3:2*columns/3,numChannels)=G(1:rows,columns/3:2*columns/3,numChannels);

% Changes all image to BW
R=G;
% G=G;
B=G;

% Left third green
R(1:rows,1:ceil(columns/3),numChannels)=0;
B(1:rows,1:ceil(columns/3),numChannels)=0;

% Right third red
B(1:rows,ceil(2*columns/3):end,numChannels)=0;
G(1:rows,ceil(2*columns/3):end,numChannels)=0;

% DISPLAY MODIFIED IMAGE
img2=cat(3,R,G,B);
figure();
imshow(img2)


% 2. Aplica a tu imagen original una transormacion geometrica tipo flip 
% y de escalamiento. A esta nueva imagen,aplica el mismo efecto que en la 
% pregunta 1.

FI=flip(img); % Horizontal mirror
SI=imresize(FI,[150,250]); % Scale

G2=SI(:,:,2);
R2=G2;
B2=G2;
[rows2, columns2, numChannels2] = size(R2);

R2(1:rows2,1:ceil(columns2/3),numChannels2)=0;
B2(1:rows2,1:ceil(columns2/3),numChannels2)=0;

B2(1:rows2,ceil(2*columns2/3):end,numChannels2)=0;
G2(1:rows2,ceil(2*columns2/3):end,numChannels2)=0;

SI2=cat(3,R2,G2,B2);
figure(); imshow(SI2);