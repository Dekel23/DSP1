d1 = 0.325694461;
d2 = 0.326064888;
d = mod(d1+d2, 0.5);
Fs = 16000;
nBits = 16; 
nChannels = 1;
file = 'recordedFile.wav';
%   creat a new audiofile and save it on the computer     
%signal = audiorecorder(Fs,nBits,nChannels); % open mic to recored
%disp("Begin speaking.")
%recDuration = 5; % set duration to 5 sec
%recordblocking(signal,recDuration); % stop recored after 5 sec
%disp("End of recording.")
%play(signal); %play back the recorded file
%y = getaudiodata(signal,"single");
%audiowrite(file, y, Fs);

%   load the recorded data from the file
y = audioread(file);
%sound(y, Fs); % play the full recored
N = 2^16;
x = y(1:N);
%sound(x, Fs); % play the cutted recored

%   creating the noise
Px = culcAvgPower(x, N);
w1 = 1.6 + 0.1*d1;
w2 = 1.6 + 0.1*d;
w3 = 3;
a1 = sqrt(Px);
a2 = sqrt(Px);
a3 = sqrt(Px);
z = zeros(N,1);
for i = 1:N
    z(i) = a1*cos(w1*i) + a2*cos(w2*i) + a3*cos(w3*i);
end

%   the new signal with original and noise
y = x + z;
%sound(y, Fs);
%i can hear only the noise and none of the original signal
figure;
plot(1:N,y);

fs = 1/128;
Y = fft(y);
frequencies = fs*(-128:127);
freqRange = [-1,1];
startIndex = find(frequencies >= freqRange(1), 1);
endIndex = find(frequencies <= freqRange(2), 1, 'last');

dtftRange = Y(startIndex:endIndex);

figure;
% Plotting the magnitude spectrum
plot(frequencies(startIndex:endIndex), abs(dtftRange));
title('DTFT of Signal in Frequency Range');
xlabel('Frequency (Hz)');
ylabel('Magnitude');

y2 = y(1:2:N);
z2 = z(1:2:N);
Z2 = fft(z2);
Y2 = fft(y2);
sound(y2, Fs/2);

dtftRange = Z2(startIndex:endIndex);

figure;
% Plotting the magnitude spectrum
plot(frequencies(startIndex:endIndex), abs(dtftRange));
title('DTFT of Signal in Frequency Range');
xlabel('Frequency (Hz)');
ylabel('Magnitude');

dtftRange = Y2(startIndex:endIndex);

figure;
% Plotting the magnitude spectrum
plot(frequencies(startIndex:endIndex), abs(dtftRange));
title('DTFT of Signal in Frequency Range');
xlabel('Frequency (Hz)');
ylabel('Magnitude');
%   culculate the avg power of a signal
function P = culcAvgPower(x,n)
    sum = 0;
    for i = 1:n
        sum = sum + x(i)^2;
    end
    P = 1/n*sum;
end

