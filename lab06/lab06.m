% Read Data
[s, Fs] = audioread('mamac1.wav');

% Effrct Coefficients
% lower the damping factor the smaller the pass band
damp = 0.05;
% min and max centrecutoff frequency of variable bandpass filter
minf = 500;
maxf = 3000;
% wah frequency, how many Hz per second are cycled through
Fw = 2000;
% change in centrefrequency per sample (Hz)
delta = Fw / Fs;
% create triangle wave
Fc = minf:delta:maxf;
while length(Fc) < length(s)
    Fc = [Fc (maxf:-delta:minf) (minf:delta:maxf)];
end
Fc = Fc(1:length(s));

% Difference Equation Coefficients
F1 = 2 * sin(pi * Fc(1) / Fs);
Q1 = 2 * damp;

% Create sample vector
yh = zeros(1, length(s));
yb = zeros(1, length(s));
yl = zeros(1, length(s));

yh(1) = s(1);
yb(1) = F1 * yh(1);
yl(1) = F1 * yb(1);

% Apply Difference Equation
for n = 2:length(s)
    yh(n) = s(n) - yl(n-1) - Q1 * yb(n-1);
    yb(n) = F1 * yh(n) + yb(n-1);
    yl(n) = F1 * yb(n) + yl(n-1);
    F1 = 2 * sin(pi * Fc(n) / Fs);
end

% Normalise
maxyb = max(abs(yb));
yb = yb/maxyb;

% Output
audiowrite('wahwah.wav', yb, Fs);