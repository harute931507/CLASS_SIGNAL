fs = 22050;
decay_factor = 0.995;
wavetable_size = floor(fs / 110);
wavetable = randi([-1 1], 1, wavetable_size);
result = karplus_strong(wavetable, 5 * fs, decay_factor);
plot(result);
audiowrite('result.wav', result, fs);

function result = karplus_strong(wavetable, n_samples, decay)
    samples = zeros(1, n_samples);
    % ring buffer
    for i = 1:length(samples)
        samples(i) = wavetable(1);
        avg = decay * 0.5 * (wavetable(1) + wavetable(2));
        wavetable = [wavetable(2:end) avg];
    end
    result = samples;
end