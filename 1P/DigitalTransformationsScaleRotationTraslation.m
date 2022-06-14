img = imread("DavyJones_Light.jpg");
figure(); imshow(img);

Ti = imtranslate(img,[250,140]);
figure(); imshow(Ti);

Ti2 = imtranslate(img,[250,140],'FillValues',255);
figure();imshow(Ti2);

Ri = imrotate(image,90);
figure();imshow(Ri);
