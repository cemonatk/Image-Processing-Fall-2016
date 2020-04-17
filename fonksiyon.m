% Cem Onat Karagun
function I = dondur( resim, derece)
% Burada satir, sutun buyukluk degerleri aliniyor.
[satir,sutun,rnk]= size(resim); 

% Derece ile cozunurlukte sorunlar yasandigi icin bazi orneklerde radyan
% kullanildigina dikkat edilip bu ornek alinmistir.
radyan=2*pi*derece/360;  

switch mod(derece, 360)
    % Eger 90 veya 0 derece ise islem fazlaligina gerek olmadigindan boyle
    % bir kullanim tercih edilmistir.
    case 0
        Donmus = resim;
    case 90
        Donmus = rot90(resim);
    otherwise
    % Dizinin boyutunun hesaplanmasi (bu sayede donen imajin son halinde tam otursun diye ona gore pencere boyutu ayarlanir).
    % derecenin sinusunun mutlak degeri bolgeye gore negatif cikabilir bu
    % yuzden mutlak degerini abs fonksiyonu ile aliyoruz.
    % Donmus isimli son hali olacak imge dizisinin olsuturulmasi kismi
    % internette hep siyah(zeros) kullanilmis ben de ones kullandim sorun
    % olmadi. Bu kisimdaki amac boyutlarin set edilmesi gibi bir sey.
    Donmus=uint8(ones([ceil(satir*abs(cos(radyan))+sutun*abs(sin(radyan))) ceil(satir*abs(sin(radyan))+sutun*abs(cos(radyan))) 3 ]));

    % Simdi de merkezi koordinatlar hesaplaniyor.
    % Merkezi X = toplam satirin yarisina denk duser. Y0 da sutunun
    % yarisi...
    xo=ceil(satir/2);                                                            
    yo=ceil(sutun/2);

    merkezx=ceil((size(Donmus,1))/2);
    merkezy=ceil((size(Donmus,2))/2);

    % her satirdaki elaman icin => i ve her sutundaki eleman icin =>
    % yani j , degisken atamasi yapiliyor.
    for i=1:size(Donmus,1)
        for j=1:size(Donmus,2)                                                       
            
            % Bu denklem :
            % http://math.stackexchange.com/questions/363652/understanding-rotation-matrices
            % Adresindeki aciklamalardan alinmistir. 
            % Ilgili kisiye, saygilarimla tesekkur ediyorum.
            x= (i-merkezx)*cos(radyan)+(j-merkezy)*sin(radyan);                                       
            y= -(i-merkezx)*sin(radyan)+(j-merkezy)*cos(radyan);                             
            x=round(x)+xo;
            y=round(y)+yo;
            
            % Bu kisimda atama islemi tam boyutlar arasinda olacak kosulda gerceklesiyor.
            if (x>=1 && y>=1 && x<=size(resim,1) &&  y<=size(resim,2) ) 
                Donmus(i,j,:)=resim(x,y,:);  
            end
        end
    end
end
% imgenin donmus hali:
imshow(Donmus);
