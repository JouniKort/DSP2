%% References: 
%Peng, S., 2013. Design and analysis of FIR filters based on Matlab.

%% The number of samples, the sampling frequency and sampling points
M = 225;fs = 44100 ; m = 0:(M+1)/2;

%% Lowpass with decimation
%the passband cut-off frequency and decimation factor
Wp = 0.025*pi; D = 4;
%stopband cut-off frequency
Wm = 2*pi*m./(M+1)/D;

%frequency response
mtr = floor(Wp*(M+1)/(2*pi))+2;
Ad = Wm <= Wp ;Ad(mtr) = 1;

%define frequency-domain sampling vector H(k)
Hd = Ad.*exp(-1i*0.5*M*Wm);

%fliplr is to realize the fliplr of matrix and conj
Lowpass_h = [Hd conj(fliplr(Hd(2:(M+1)/2)))];

%% Bandpass
%the passband cut-off frequency
Wp = 0.22*pi;
%the stopband cut-off frequency
Wm = 2*pi*m./(M+1);

%frequency response
mtr = floor(Wp*(M+1)/(2*pi))+2;
Ad = Wm <= Wp; Ad(mtr) = 1;

%Stopband for low frequencies
Ad(1:4) = 0;

%define frequency-domain sampling vector H(k)
Hd = Ad.*exp(-1i*0.5*M*Wm);
%fliplr is to realize the fliplr of matrix and conj
Bandpass_h = [Hd conj(fliplr(Hd(2:(M+1)/2)))];

%% Highpass
%the passband cut-off frequency
Wp = 0.766*pi;
%the stopband cut-off frequency
Wm = 2*pi*m./(M+1);

%frequency response
mtr = floor(Wp*(M+1)/(2*pi))+2;
Ad = Wm<=Wp ;Ad(mtr) = 1;

%flip lowpass to get highpass
Ad = flip(Ad);

%define frequency-domain sampling vector H(k)
Hd = Ad.*exp(-1i*0.5*M*Wm);
%fliplr is to realize the fliplr of matrix and conj
Highpass_h = [Hd conj(fliplr(Hd(2:(M+1)/2)))];