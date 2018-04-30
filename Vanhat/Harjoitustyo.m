% clc;
clear;

M = 64;
k = 0:M/2-1;

Fs = 44100;
f_low_cutoff = 1500;
w_low_cutoff = 2*pi*(f_low_cutoff/Fs);

f_band1 = 5000;
w_band1 = 2*pi*(f_band1/Fs);
f_band2 = 9500;
w_band2 = 2*pi*(f_band2/Fs);

f_high_cutoff = 14000;
w_high_cutoff = 2*pi*(f_high_cutoff/Fs);

%%
% Real valued frequency samples for FIR filter with M length
% Indices takes into account that Matlab indices starts from 1
clf
Hr_low = zeros(size(k));
Hr_low(0+1) = 1;
Hr_low(1+1) = 1;
Hr_low(2+1) = 98/100;
Hr_low(3+1) = 3/4;
Hr_low(4+1) = 1/4;
Hr_low(5+1) = 2/100;

Hr_band = zeros(size(k));
Hr_band(2+1) = 2/100;
Hr_band(3+1) = 1/4;
Hr_band(4+1) = 3/4;
Hr_band(5+1) = 98/100;
Hr_band(6+1) = 995/1000;
Hr_band(7+1) = 995/1000;
Hr_band(8+1) = 98/100;
Hr_band(9+1) = 3/4;
Hr_band(10+1) = 1/4;
Hr_band(11+1) = 2/100;

Hr_high = ones(size(k));
Hr_high(0+1) = 0;
Hr_high(1+1) = 0;
Hr_high(2+1) = 0;
Hr_high(3+1) = 0;
Hr_high(4+1) = 0;
Hr_high(5+1) = 0;
Hr_high(6+1) = 0;
Hr_high(7+1) = 0;
Hr_high(8+1) = 2/100;
Hr_high(9+1) = 1/4;
Hr_high(10+1) = 3/4;
Hr_high(11+1) = 98/100;

[Lowpass, w, A_l, B_l] = Draw(Hr_low, M, k, 1);
[Bandpass, ~, A_b, B_b] = Draw(Hr_band, M, k, 1);
[Highpass, ~, A_h, B_h] = Draw(Hr_high, M, k, 1);

subplot(2,1,2)
plot(w(1:490), Lowpass(1:490)+Bandpass(1:490)+Highpass(1:490))
grid on;
axis([0 3 0.8 1.1])
hold off

t = 0:1/Fs:0.25;
Y = chirp(t,10,t(end),5000);
sf = filter(Lowpass,1,Y);
figure(10)
subplot(2,1,1)
plot(t,sf)
subplot(2,1,2)
Fsf = fft(sf,512); AFsf = abs(Fsf);
f = (0:255)*Fs/512;
plot(f,AFsf(1:256))