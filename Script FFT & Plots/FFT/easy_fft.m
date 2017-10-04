function [freq_axis, signal_spectrum] = easy_fft(signal, sample_freq, varargin)
	if nargin >= 3
		num_points = varargin{1};
	else
		num_points = length(signal);
	end
	
	if mod(num_points, 2) == 1
		num_points = num_points + 1;
	end
	
	freq_axis = linspace(0, sample_freq, num_points / 2);
	freq_axis = [-flip(freq_axis(2 : end)), freq_axis] / 2;
	freq_axis = [2 * freq_axis(1) - freq_axis(2), freq_axis];
	
	signal_spectrum = fftshift(fft(signal, num_points));
end
	
	