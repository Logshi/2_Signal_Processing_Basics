figure;
subplot(4,1,1);
plot(t, noisy_signal);
title('Original Noisy Signal');

subplot(4,1,2);
plot(t, filtered_signal_low);
title('Low-Pass Filtered Signal');

subplot(4,1,3);
plot(t, filtered_signal_high);
title('High-Pass Filtered Signal');

subplot(4,1,4);
plot(t, filtered_signal_band);
title('Band-Pass Filtered Signal');

%Visualize in Frequency Domain: 
N = length(t);
f = fs*(0:(N/2))/N;  % Frequency vector

% FFT of the noisy signal
noisy_fft = fft(noisy_signal);
noisy_fft_mag = abs(noisy_fft/N);  % Magnitude of FFT
noisy_fft_mag = noisy_fft_mag(1:N/2+1);  % Single-sided spectrum

% FFT of the filtered signals
filtered_fft_low = abs(fft(filtered_signal_low)/N);
filtered_fft_high = abs(fft(filtered_signal_high)/N);
filtered_fft_band = abs(fft(filtered_signal_band)/N);

figure;
subplot(4,1,1);
plot(f, noisy_fft_mag);
title('FFT of Noisy Signal');

subplot(4,1,2);
plot(f, filtered_fft_low(1:N/2+1));
title('FFT of Low-Pass Filtered Signal');

subplot(4,1,3);
plot(f, filtered_fft_high(1:N/2+1));
title('FFT of High-Pass Filtered Signal');

subplot(4,1,4);
plot(f, filtered_fft_band(1:N/2+1));
title('FFT of Band-Pass Filtered Signal');
