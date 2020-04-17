% Cem Onat Karagun
% imgenin okunmasi ve derecenin alinmasi.
imaj = imread('manzara.jpg');
derece = 45;
% hazir fonksiyon ile dondurme islemi.
figure(1)
imshow(imrotate(imaj,derece));

% odev icin yazilmis fonksiyona istenilen parametrelerin verilmesi.
figure(2)
fonksiyon(imaj,derece);
