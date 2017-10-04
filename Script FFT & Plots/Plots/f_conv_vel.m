function [y] = f_conv_vel(filename)
	volt_rifer = 8.902085; 
	A = -5.32286;
	B = 4.39047;
	n = 0.5;
	
	if ischar(filename)
		temp = load(filename);
	else
		temp = filename;
	end
	
	volt_diff = (temp - volt_rifer) .^ 2;
	y = ((volt_diff - A) / B) .^ (1 / n);
end

