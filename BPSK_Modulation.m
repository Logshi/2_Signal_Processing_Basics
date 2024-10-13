% Generate a random binary sequence
bits = randi([0 1], 1, 1000);

%BPSK modulation: Map 0 to -1 and 1 to 1
bpsk_signal = 2*bits - 1;

%Carrier signal
fs = 1000;
fc = 100;
t = (0:length(bits)-1)/fs;
carrier = cos(2*pi*fc*t);

%modulated signal
modulated_signal = bpsk_signal .* carrier;

% Plot modlatd signal
figure;
plot(t,modulated_signal);
title('BPSK Modulated Signal');


% Add Gaussian noise
noise = 0.5*randn(size(modulated_signal));
noisy_signal = modulated_signal + noise;

% Plot noisy signal
figure;
plot(t, noisy_signal);
title('Noisy BPSK Signal');

% Multiply received signal with carrier
received_signal = noisy_signal .* carrier;

% Low-pass filter to extract the signal
[b, a] = butter(5, 2*fc/fs, 'low');
filtered_signal = filter(b, a, received_signal);

% Decision rule: If filtered signal > 0, it's a 1, otherwise it's a 0
demodulated_bits = filtered_signal > 0;

% Plot demodulated signal
figure;
plot(t, demodulated_bits);
title('Demodulated BPSK Signal');

% Calculate Bit Error Rate (BER)
bit_errors = sum(bits ~= demodulated_bits);
ber = bit_errors / length(bits);
fprintf('Bit Error Rate: %.4f\n', ber);

