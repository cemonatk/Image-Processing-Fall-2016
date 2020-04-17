% Cem Onat Karagun
function imgout = fonksiyonum(image)

boyut=size(image,1)*size(image,2); % boyutunun belirlenmesi
% Son imgenin boyutunun ayni olmasi gerekli, haliyle ilk imgenin boyutunda
% bir tur bos(zerolarla dolu) matrix olusturuyoruz.
last=uint8(zeros(size(image,1),size(image,2))); % olusturma islemi tamam, uint8= unsignet int 8 bt => 256 max yani 0-255 (bkz: RGB).

% Hocam, keske matlabda soyle degisken atama olabilseymis => cum,histogram,pdf,imgout=zeros(256,1);
% Belki zeros fonksiyonunun kaynak koduna bakip update gecebiliriz.
histogram=zeros(256,1);
cum=zeros(256,1);
pdf=zeros(256,1);
imgout=zeros(256,1);

%Olasilik yogunluk hesaplanmasi aka PDF:   
for  i=1:size(image,1) % imgenin x kadar...
     for  j=1:size(image,2) % y kadar...
        temp=image(i,j); % i,j noktasindaki RGB degerinin tempory(gecici degisken) e atanmasi.
        histogram(temp+1)=histogram(temp+1)+1; 
        pdf(temp+1)=histogram(temp+1)/boyut; % iste burada boyuta oran uzerinden pdf hesaplaniyor.
     end
end   
toplam=0; 
for  i=1:size(pdf)
    toplam = toplam + histogram(i);
    cum(i)=toplam;
    imgout(i)=round(((cum(i)-1)/(boyut-1))*(255));  %Her bir pixel degerini kaca cekmem gerektigini bu formulle hesapliyoruz.
end

   
for  i=1:size(image,1) % imgenin x sayisi kadar.
     for  j=1:size(image,2)% imgenin y sayisi kadar.
     last(i,j)=imgout(image(i,j)+1); % son cikacak imgeye ata degerleri +1 degeri.
     end
end

figure(2); % figure ile kullanilmaz ise birini sadece gosteriyordu matlab.
imshow(last); 
title('Son hali'); 

end
% Saygilarimla, Cem.
