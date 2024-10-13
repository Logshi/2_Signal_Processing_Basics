% Load an audio file (spoken word)
[audio, fs] = audioread('speech.wav');
audio = audio(:, 1);  % Convert to mono

% Extract MFCC features
coeffs = mfcc(audio, fs);

% Plot the MFCC coefficients
figure;
imagesc(coeffs);
title('MFCC Coefficients');
xlabel('Time');
ylabel('MFCC Coefficients');
colorbar;