close all;

%% Exercice 1
[x, fs] = audioread('bond.wav');
%sound(x, fs);

Ts = 1/fs;
N = length(x);
t = [0:Ts:(N-1)*Ts];
duree = N/fs

%% Exercice 2
figure;
plot(t, x);

% Calcul de la FFT
N = length(x);
Nfft= 10 * N; 
X = fft(x, Nfft);
X_shift = fftshift(X);
freq_X = linspace (-fs/2, fs/2, Nfft);

figure;
plot(freq_X, X_shift);

%% Exercice 3
fs_new = 3.072e6; % Nouvelle fréquence d'échantillonnage, par exemple 3.072 MHz
[p, q] = rat(fs_new / fs);

x_resampled = resample(x, fs_new, fs);
x_mod = modulation_PDM(x_resampled, 0);
save('Signals/x_mod.mat', 'x_mod');

%% Exercice 4
OS=64;
F_mod = fs_new/OS;
Ts_new = 1/F_mod;

N_mod = length(x_mod);
t_mod = [0:Ts_new:(N_mod-1)*Ts_new];
freq_mod=-fs_new/2:fs_new/N_mod:fs_new/2-fs_new/N_mod;

X_resampled=(abs(fftshift(fft(x_resampled)).^2))/N_mod;
X_mod=(abs(fftshift(fft(x_mod)).^2))/N_mod;

figure(); 
subplot(2,1,1); hold on;
plot(t_mod, x_resampled);
plot(t_mod, x_mod);
xlabel('Temps (s)');
ylabel('Amplitude (V)');
title('Representation temporelle du signal PDM');
legend('Signal surechantillonnee', 'signal PDM');

subplot(2,1,2); hold on;
plot(freq_mod, 10*log10(X_resampled));
plot(freq_mod, 10*log10(X_mod));
xlabel('Frequence (Hz)');
ylabel('Puissance/frequence (dB/Hz)');
title('Representation frequentielle du signal PDM');
legend('Signal surechantillonnee', 'signal PDM');

figure(); hold on;
plot(freq_mod, 10*log10(X_mod));
plot(freq_mod, 10*log10(X_resampled));
plot(freq_X, X_shift);
xlabel('Frequence (Hz)');
ylabel('Puissance/frequence (dB/Hz)');
title('Representation frequentielle du signal PDM');
legend( 'signal PDM','Signal surechantillonnee',  'Signal audio');
xlim([-24e3 24e3]);







