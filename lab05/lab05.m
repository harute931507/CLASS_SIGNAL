% Read Data
[s,Fs] = audioread('clean.wav');
Soft_s = s;
Hard_s = s;

% Setting
Range = 0.05;
var_a = 0.5;
Max = max(s) * Range;
Min = min(s) * Range;

% Soft Clipping
for x = 1:length(Soft_s)
    if Soft_s(x) > Max
        Soft_s(x) = Max + var_a * (Soft_s(x) - Max);
    end
    if Soft_s(x) < Min
        Soft_s(x) = Min + var_a * (Soft_s(x) - Min);
    end
end
% Hard Clipping
for x = 1:length(Soft_s)
    if Hard_s(x) > Max
        Hard_s(x) = Max;
    end
    if Hard_s(x) < Min
        Hard_s(x) = Min;
    end
end

% Output
audiowrite( 'distortion_soft_clipping.wav', Soft_s, Fs);
audiowrite( 'distortion_hard_clipping.wav', Hard_s, Fs);
