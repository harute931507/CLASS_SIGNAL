% Init
LR = [0.55, 0.6, 0.3, 0.3; 
    0.4, 0.8, 0.5, 0.4];

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
L = LR(1, :) * S;
R = LR(2, :) * S;

% Output
result = [L, R];
audiowrite( 'result_1.wav', result, Fs);

% %%%%%
% Transpose
% s0 = S0';
% s1 = S1';
% s2 = S2';
% s3 = S3';
%  
% Combine
% left = s0*0.55 + s1*0.6 + s2*0.3 + s3*0.3;
% right = s0*0.4 + s1*0.8 + s2*0.5 + s3*0.4;
% result = [left, right];