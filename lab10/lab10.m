% Read Data
[s, Fs] = audioread('2.wav');

% Setting
L = length(s);
multiple = 6;
delay = floor(Fs/10) * multiple; % 0.1s * miltiple
B = [1 1 1];
M = [1 3 5];
C = [0.3 0.09 0.027];
G = [0.5 0.5 0.5];
d = 0.5;
q = eye(3);

% Allocate
direct_Signal = zeros(1, L + delay * M(3));
reflection_Signal = zeros(1, L + delay * M(3));
direct_Signal(1:L) = s;

% Buffer
x1 = B(1) * direct_Signal;
x2 = B(2) * direct_Signal;
x3 = B(3) * direct_Signal;
% Shift
reflection_Signal_1 = [ones(1, delay * M(1)) x1];
reflection_Signal_2 = [ones(1, delay * M(2)) x2];
reflection_Signal_3 = [ones(1, delay * M(3)) x3];

reflection_Signal_1 = reflection_Signal_1(1:L + delay * M(3));
reflection_Signal_2 = reflection_Signal_2(1:L + delay * M(3));
reflection_Signal_3 = reflection_Signal_3(1:L + delay * M(3));

reflection_Signal_q = [reflection_Signal_1;
                        reflection_Signal_2;
                        reflection_Signal_3];
% Reflection                    
reflection_Signal_r = reflection_Signal_q' * q;
x1 = x1 + G(1) * reflection_Signal_r(:,1)';
x2 = x2 + G(2) * reflection_Signal_r(:,2)';
x3 = x3 + G(3) * reflection_Signal_r(:,3)';
% Combine
R = [x1 + reflection_Signal_1; x2 + reflection_Signal_2; x3 + reflection_Signal_3];
reflection_Signal = reflection_Signal + C * R;
reverb = reflection_Signal + d * direct_Signal;

audiowrite('result.wav', reverb, Fs);