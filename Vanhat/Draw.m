function [filter, w, A, B] = Draw(Hr,M,k,d)
% According to Proakis Table 8.3 (4th ed. 10.3)
G = (-1).^k.*Hr;
G(M-k+1) = -G(k+1);

% Frequency response according to Table
H = G.*exp(1i*pi*(0:M)/M);

% Coefficients A(k) of frequency-sampling method
% Real-valued part is only taken, small complex-valued parts may be seen in
% computation
A = real(H(k+1)+H(M-k+1));
B = real(H(k+1).*exp(-1i*2*pi*k/M)+H(M-k+1).*exp(1i*2*pi*k/M));

h = [];
for n = 0:M/2-1
    h(n+1) = 1/M*(G(0+1)+2*sum(G(k+2).*cos((2*pi*(k+1)/M)*(n+0.5))));
end

% Filling to symmetric with length of M
h = [h h(length(h):-1:1)];

% Checking that frequency response is as it is wanted.
% freqz gives frequency response between 0...pi, so let's take M/2 samples.
[Hcheck,~] = freqz(h,1,M/2);
abs(Hcheck)

% Let's take more samples to plot more accurate frequency response
[Hoo,w] = freqz(h,1);
if d == 1
    subplot(2,1,1)
    plot(w(1:490),abs(Hoo(1:490))); grid;
    %figure(2), plot(w,angle(Hoo)); grid;

    % Let's add original frequency samples into same figure
    figure(1); hold on;
    plot(2*pi*k/M,Hr,'ro')
    axis([0 3 0 1.1])
end

filter = abs(Hoo);
end