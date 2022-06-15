
RGB = imread('cup.png');
SI=imresize(RGB,[450,750]);
imshow(SI);

% 1)  Elige una imagen y conviértela en escala de grises.
GS = rgb2gray(SI);
size(GS);
figure(); imshow(GS);


% 2) Aplica la función gamma a la imagen en escala de grises.

% First Solution without formula
% I = imadjust(GS,[],[],0.5);
% J = imadjust(GS,[],[],1.25);
% M = imadjust(GS,[],[],3.25);
% figure(); imshowpair(GS,I,"montage");
% figure(); imshowpair(GS,J,"montage");
% figure(); imshowpair(GS,M,"montage");

% % First Solution with formula
gval = 1.8;

% 8 bits --> 255
for cols = 1:size(GS,2)
    for rows = 1:size(GS,1)
        GS(rows,cols) = 255*(double(GS(rows,cols))/255)^1/gval;
    end
end
figure(); imshow(GS);


% 3) Repite el proceso con 3 valores diferentes de Gamma. ¿Qué
% efecto se obtiene a la imagen al aplicar la función gamma? ¿Cómo
% influye el valor de gamma en el resultado final?

gamma = [0.5, 1.25, 3.25];
for i = 1:3
    for cols = 1:size(GS,2)
        for rows = 1:size(GS,1)
            GS(rows,cols) = 255*(double(GS(rows,cols))/255)^1/gamma(i);
        end
    end
    figure(); imshow(GS);
end

% Cuando se aplica la función gamma, tenemos un cambio en el contraste y 
% la iluminación de la imagen. En otras palabras, el gamma es el valor
% brillante y oscuro relativo de nuestra imagen.


% El valor de gamma nos indica cuanta modificación tendrá el contaste. 
% Por ejemplo en la imagen en escala de grises, un gamma mayor oscurecía 
% más la imagen.

% 4) Aplica la función gamma a una imagen de color y observa el
% resultado obtenido. ¿El efecto obtenido al aplicar gamma en
% una imagen a color es el mismo que el obtenido en imágenes
% en escala de grises?

for cols = 1:size(SI,2)
    for rows = 1:size(SI,1)
        SI(rows,cols) = 255*(double(SI(rows,cols))/255)^1/gval;
    end
end
figure(); imshow(SI);

% Al igual que en la escala de grises, existe un cambio en el contraste de nuestra imagen.
% Para nuestra imagen, el cambio en el contraste (con ese valor de gamma), hizo que la 
% imagen tuviera más presencia del color verde.

% 5) Repite el proceso para 3 valores diferentes de gamma.

for i = 1:3
    for cols = 1:size(SI,2)
        for rows = 1:size(SI,1)
            SI(rows,cols) = 255*(double(SI(rows,cols))/255)^1/gamma(i);
        end
    end
    figure(); imshow(SI);
end
