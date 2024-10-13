% generate or Load a Noisy Signal
fs = 1000;
t = 0:1/fs:1-1/fs%time vector
f_signal = 50;% 50 Hz
signal = sin(2*pi*f_signal*t); %clean sine wave
noise = 0.5*randn(size(t)); %random noise
noisy_signal = signal + noise;