[s, Fs] = audioread('1.wav');

gain = [0.2, 0.5, 1.3, 1, 0.2, 0.3];
fc = [0.05, 0.2, 0.3, 0.4, 0.5];
result = ones(1,length(s))';

% Order of the Filter
N = 1 ;
for i = 1:6
    if i == 1
        [b, a] = butter(N, fc(1), 'low');
    elseif i == 6
        [b, a] = butter (N, fc(5), 'high');
    else
        [b, a] = butter (N, [fc(i-1) fc(i)], 'bandpass');
    y = filter(b, a, s);
    result = result + gain(i) * y;
    end
end
audiowrite('result.wav', result, Fs);