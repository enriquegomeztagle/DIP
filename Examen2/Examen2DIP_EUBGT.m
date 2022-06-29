% C´odigo de ´etica: “Certifico que el trabajo realizado en este examen es estrictamente personal y reconozco
% que no cumplir las reglas o COMETER ACTOS DESHONESTOS en los ex´amenes puede resultar en la baja
% definitiva de la Universidad”.

close all; clear; clc;

%%
% 1. Dada la imagen streetNoisy.png, realiza el proceso correspondiente, de tal manera que se obtenga
% una imagen similar a la Figura 1(b). Utiliza las t´ecnicas vistas en clase. Puedes realizar procesamiento en
% el espacio o en la frecuencia.

close all; clear; clc;

% CARGAR IMAGEN
img=double(rgb2gray(imread('streetNoisy.png')));
figure; imshow(img,[]); title('Original Image');

% APLICAR FILTROS
img_mediana=medfilt2(img, [9,9]);
% figure; imshow(img_mediana,[]); title('Imagen filtrada mediana');

img_promedio=imfilter(img_mediana, ones(5,5)/25);
% figure; imshow(img_promedio,[]); title('Imagen filtrada promedio');

img_gauss=imgaussfilt(img_promedio, 4, 'FilterSize', 9);
% figure; imshow(img_gauss,[]); title('Imagen filtrada gauss');

% imtool(img_gauss);

% CONTRAST STRETCHING
contrast_stretch=(255/195)*(img_gauss-60);
z = zeros(size(contrast_stretch));

% THRESHOLD
z(contrast_stretch<220)=1;

% NEGATIVO PARA FONDO NEGRO
% z = 255-z;
z = -z;
figure; imshow(z,[]); title('Final Image');

%%
% 2. Dada la siguiente imagen noisyOffice.png en Moodle. Genera su versi´on sin ruido y con un balance de
% intensidad de luz adecuado.

close all; clear; clc;

img2=imread('noisyOffice.png');
figure; imshow(img2); title('Original Image');

% APLICA FILTRO DE MEDIANA CON VENTANA 5
img_mediana=medfilt2(img2, [5 5]);
figure; imshow(img_mediana); title('Filtered Image');

% BALANCE INTENSIDAD LUZ con imadjust
img_contrast=imadjust(img_mediana);
figure; imshow(img_contrast); title('Adjusted Image');

% BALANCE INTENSIDAD LUZ con gamma
GS=img_mediana;
gval = .5;
for cols = 1:size(GS,2)
    for rows = 1:size(GS,1)
        GS(rows,cols) = 255*(double(GS(rows,cols))/255)^1/gval;
    end
end
figure(); imshow(GS); title('Gamma Image');

%%
% 3. BONUS + 1 en el examen te´orico: Realiza el c´odigo correspondiente al diagrama a bloques mostrado
% en la Figura 3 y obten la imagen en versi´on scketch.

close all; clear; clc;

img3=imread('shield.jpg');
figure; imshow(img3); title('Original Image');

% Convertir a escala de grises
img_gray=double(rgb2gray(img3));
figure; imshow(img_gray, []); title('Grayscale Image');

% Desenfoque agresivo de la imagen
img_blur=medfilt2(img_gray, [20 20]);
figure; imshow(img_blur, []); title('Blur Image');

% Division pixel a pixel de la imagen en escala de grises entre la imagen desenfocada
img_div=img_gray./img_blur;
figure; imshow(img_div); title('Sketch Image');
