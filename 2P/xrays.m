% NEGATIVE IMAGE
% g(x, y) = 255 − f(x, y) 

% ¿QUÉ SUCEDE SI CAMBIAMOS LOS RANGOS LOS BINS EN EL HISTOGRAMA?
% inNormalizada = double(imGris)/(2n -1);
% figure(); H = histogram(imGris);% Matlab obtiene el núm de Bins
% figure(); H = histogram(imGris, nBins);

% ORIENTACIÓN DEL HISTOGRAMA EN EL EJE x
% La luminosidad (brightness) de una imagen se modifica aplicando la
% función gamma (γ). γ cambia la ubicación dominante del histograma
% en el eje x.
% imGamma = (double(imGris)/(2n-1))·ˆ (1/Gamma) ∗ (2n-1);

%%%% THRESHOLDING
% ¿PARA QUÉ ME SIRVE CONOCER LOS TONOSDOMINANTES? THRESHOLDING
% ¿Qué es un umbral? Un umbral es un valor que se establece como máximo,
% mínimo o punto de inflexion en una función. Recordemos que una imagen también es
% una función.

% EJEMPLO MANUAL
% imTh = (imGray>th1)
% imTh = (imGray<th1)
% imTh = ((imGray>th1) & (imGray<th2))

img = imread('xray.jpeg');
figure(); imshow(img);
figure(); h=histogram(img);

B = zeros(size(img));
B(img>170) = 1;
figure(); imshow(B);

X = [1 2 3 4 5 6 7; 7 6 5 4 3 2 1; 0 0 0 0 0 0 0; 1 1 1 1 1 1 1];
X(1:3, 1)=50;
Y = ones(size(X));
Y(X==1)=80;

C=img;
C(C>170)=1;
C(img<170)=0;
figure(); imshow(C);
