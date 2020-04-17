% Cem Onat Karagun

clc;close all;
imge = imread('car.jpg'); 
imshow(imge); % ilk hali.
hsv = rgb2hsv(im2double(imge));
% rgb2(to) hsv fonksiyonu ile rgb den hsv'ye.
% im 2 double ile imgeyi double veri tipine donduruyoruz.

svalue = hsv(:,:,2) > 0.78 & hsv(:,:,2) < 0.975; % hsv'nin s degiskeni
% bu degerleri once fotoyu acip icindeki rgb degerlerine baktim. dedim ki su
% degerler arasi turuncu demek ki. 
% Sonra internette o rgb deger araliklarini
% hsv karsiliklarina donusturdum.
vvalue = hsv(:,:,3) > 0.825 & hsv(:,:,3) < 1; % v degiskeni

sonhali = svalue | vvalue;

se = strel('disk', 2, 0); % strel fonksiyonu ile kolayca obje olusturuluyor. 
% orn disk yerine 'diamond' vb kullanilabilir.

final = imopen(sonhali,se);
figure; %2. bi windowla gosterelim.
% bosluklarin yok edilmesi

imshow(imfill(final, 'holes'));
