% Funziona SOLO su .bmp a 16bit in scala di grigi

clear; close all; clc;

num_imm = 150;
imag = cell(1, num_imm);

files = dir('.\*.bmp');

for k = 1 : num_imm;
	imag{k} = imread(files(k).name);
end

minim_0 = min(imag{1}, imag{2});

for k = 2 : num_imm - 1;
	minim = min(minim_0, imag{k + 1});
	minim_0 = minim;
end

for k = 1 : num_imm;    
	imag{k} = abs(imag{k} - minim);    
end

for k = 1 : num_imm;
	imwrite(imag{k}, ['f_', files(k).name]);
end

imwrite(minim, 'f_minim.bmp');