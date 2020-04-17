%renkli resim:
resim = imread('manzara.jpg');
%siyah/beyaz resim:
resim2 = imread('sb-araba.jpg');

imshowpair(resim, resim2, 'montage')
%hocam sirasiyla gosterin dememissiniz.

resim(1,1,:)
resim(5,10,:)
resim(10,15,:)
resim(20,20,:)
resim2(1,1,:)
resim2(5,10,:)
resim2(10,15,:)
resim2(20,20,:)
