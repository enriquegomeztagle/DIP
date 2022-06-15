
% 1) Descarga 3 imagenes a color y conviértelas a escala de grises.

img1 = imread('buho.png');
figure(); imshow(img1);
% img2 = imread('jc.png');
% figure(); imshow(img2);
% img3 = imread('up.png');
% figure(); imshow(img3);

GS1 = rgb2gray(img1);
figure(); imshow(GS1);
% GS2 = rgb2gray(img2);
% figure(); imshow(GS2);
% GS3 = rgb2gray(img3);
% figure(); imshow(GS3);

% 2) Obten el histograma de las 3 imágenes.
figure();
H1 = histogram(GS1);
% figure();
% H2 = histogram(GS2);
% figure();
% H3 = histogram(GS3);

% 3) ¿Encontraste alguna diferencia? ¿se parecen entre sí los histogamas de tus 3 imágenes? 
% ¿Se podría utilizar únicamente el histograma para representar a una imagen?

% A) Las figuras 8 y 7 tienen cierta similitud, ya que en ambos la barra más alta está en la zona final (+250).
% Los tres histogramas en similitud tiene grandes cantidades de blancos
% Aunque en las 3 se nota de manera distinta la distribución (número de barras / bins).

% B) No, ya que un mismo histograma puede representar varias imágenes.
% Un histograma solo representa cuantos pixeles hay de cada uno de los 
% bins, pero no nos dice en que posición podemos encontrarlos. 

% 4) Selecciona una de tus imagenes en escala de grises y aplica la
% función gamma para 3 valores diferentes de gamma. ¿Qué observaste? 
% ¿Se modificó el histograma de la imagen al aplicar la función gamma? 
% ¿Tiene alguna relación la modificación que sufrió el histograma con el 
% valor de gamma aplicado?
GS=GS1;
gamma = [0.5, 1.25, 3.25];
for i = 1:3
    for cols = 1:size(GS,2)
        for rows = 1:size(GS,1)
            GS(rows,cols) = 255*(double(GS(rows,cols))/255)^1/gamma(i);
        end
    end
    figure(); imshow(GS);
    figure(); histogram(GS);
end

% Si se modifica el histograma, ya que cambia el contraste, conforme aumenta el valor de gamma
% el histograma tiende a más valores en la zona final (+250) del histograma. Y conforme
% el valor de gamma disminuye, tiende mas a la izquierda, por la iluminación.

