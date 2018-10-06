% Init
LR = [-3, -3, -6, -5; 
    -5, -2, -4, -5];

% Read Data
[s0,Fs] = audioread('track0.wav');
[s1,Fs] = audioread('track1.wav');
[s2,Fs] = audioread('track2.wav');
[s3,Fs] = audioread('track3.wav');

% Resize 
S0 = [zeros(1,Fs*0) ,s0',zeros(1,Fs*20)];
S1 = [zeros(1,Fs*1) ,s1',zeros(1,Fs*19)];
S2 = [zeros(1,Fs*13) ,s2',zeros(1,Fs*7)];
S3 = [zeros(1,Fs*20) ,s3',zeros(1,Fs*0)];

% Combime
S = [S0; S1; S2; S3];
L = 10 .^ ( LR(1, :) / 10) * S;
R = 10 .^ ( LR(2, :) / 10) * S;

% Output
result = [L, R];
audiowrite( 'result_2.wav', result, Fs);