%% Exercice 1
A = 1;
fs = 3.072e6;
f = 1e3;
Ts = 1/fs;
Tmax = 10e-3;
t = [0:Ts:Tmax];

s = A*sin(2*pi*f*t);

% Calcul de la FFT 
N = length(s);
Nfft= 10 * N; 
S = fft(s, Nfft);
S_shift = fftshift(S);
freq_S = linspace (-fe/2, fe/2, Nfft);


%% Exercice 2
s_mod = modulation_PDM(s, 0);

% Calcul de la FFT modulé
N = length(s_mod);
Nfft= 10 * N; 
S_mod = fft(s_mod, Nfft);
S_mod_shift = fftshift(S_mod);
freq_S_mod = linspace (-fe/2, fe/2, Nfft);

%% Exercice 3
figure;
subplot(1, 2, 1);
plot(t, s);
subplot(1, 2, 2);
plot(t, s_mod);
hold on;
plot(t, s, 'k');

figure;
plot(freq_S_mod, abs(S_mod_shift));
hold on;
plot(freq_S, abs(S_shift));
xlabel('Fréquence');
ylabel('Amplitude');