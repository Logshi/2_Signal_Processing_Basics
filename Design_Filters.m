[b, a] = butter(4, 100/(fs/2), 'low');  % Low-pass filter with cutoff at 100 Hz
filtered_signal_low = filter(b, a, noisy_signal);

[b, a] = butter(4, 200/(fs/2), 'high');  % High-pass filter with cutoff at 200 Hz
filtered_signal_high = filter(b, a, noisy_signal);


[b, a] = butter(4, [100 300]/(fs/2), 'bandpass');  % Band-pass between 100 and 300 Hz
filtered_signal_band = filter(b, a, noisy_signal);

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
