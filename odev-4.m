% Cem Onat Karagun

img = im2double(rgb2gray(imread('guzelbirarabaresmi.jpg')));
% Hocam zipten cikartmakla ugrasmak istemez iseniz:
% img = im2double(rgb2gray(imread('http://www.cs.cmu.edu/~chuck/lennapg/len_std.jpg')));

figure(1),imshow(img),title('Original');

kernel1 = [ 1 1 1 ; 1 1 1 ; 1 1 1 ] / 9; % 3x3 kernel1.
kernel2 = [-1 -1 -1 ; -2 10 -2 ; -1 -1 -1] % 3x3 kernel2.

% Kerne1 matrisi LPF gibi davranmistir.
kernel1_etkisi = im2uint8(conv2(img,kernel1));
figure(2),imshow(kernel1_etkisi),title('h1 Kernel Etkisi');
% Kerne2 matrisi HPF gibi davranmistir.
kernel2_etkisi = im2uint8(conv2(img,kernel2));
figure(3),imshow(kernel2_etkisi),title('h2 Kernel Etkisi');
