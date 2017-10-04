% Taglia e trasforma le immagini da TIF doppie a BMP
size_x = 2080;
size_y = 1392;

files = dir('.\*.tif');

for file = files'
	a = file.name;
	fprintf('Processing %s\n', a);
	b = imread(a, 'tif');
	c = b / 256;
	d = uint8(c);
	im1 = d(1 : size_x / 2, 1 : size_y);
	im2 = d(size_x / 2 + 1 : size_x, 1 : size_y);
	e = [a(1 : end - 4), '_a.bmp'];
	f = [a(1 : end - 4), '_b.bmp'];
	imwrite(im1, e, 'bmp');
	imwrite(im2, f, 'bmp');
end
