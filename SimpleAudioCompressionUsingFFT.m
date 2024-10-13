% Load an audio file
[audio, fs] = audioread('audiofile.wav');
audio = audio(:,1);  % Convert to mono

% FFT for frequency domain representation
audio_fft = fft(audio);
N = length(audio);
f = (0:N-1)*(fs/N);  % Frequency vector

% Zero out small magnitude frequencies for compression
threshold = max(abs(audio_fft)) * 0.05;
audio_fft(abs(audio_fft) < threshold) = 0;

% Reconstruct compressed audio using inverse FFT
compressed_audio = real(ifft(audio_fft));

% Play original and compressed audio
sound(audio, fs); pause(5); sound(compressed_audio, fs);

% Plot original and compressed audio signals
subplot(2,1,1); plot(audio); title('Original Audio');
subplot(2,1,2); plot(compressed_audio); title('Compressed Audio');
% Save the compressed audio as a WAV file
audiowrite('compressed_audio.wav', compressed_audio, fs);
