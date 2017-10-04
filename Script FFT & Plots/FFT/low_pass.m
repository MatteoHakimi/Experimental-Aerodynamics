function signal_out = low_pass(signal_in, filter_freq, sample_freq, varargin)
	if nargin >= 4
		num_points = varargin{1};
	else
		num_points = length(signal_in);
	end
	
	[freq_axis, signal_spectrum] = easy_fft(signal_in, sample_freq, num_points);
	
	signal_spectrum(abs(freq_axis) > filter_freq) = 0;
	
	signal_out = ifft(ifftshift(signal_spectrum), num_points);
end