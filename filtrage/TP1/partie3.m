clear all;
close all;
clc;

% Parametres generaux
f_mod=3.072e6;
OS=64;
fout=f_mod/OS;
tout=1/fout;

% Partie 3 - Traitement du signal PDM audio
%%% Chargement du signal audio
[y, fs]=audioread('bond.wav');
N=length(y);
t=0:1/fs:(N-1)/fs;
f_s=-fs/2:fs/N:fs/2-fs/N;
X=(abs(fftshift(fft(y))).^2)/N;
%%% Chargement du signal PDM
load('Signals/x_mod.mat');
N_pdm=length(x_mod);
tp=0:tout:(N_pdm-1)*tout;
f_pdm=-f_mod/2:f_mod/N_pdm:f_mod/2-f_mod/N_pdm;
X_mod=(abs(fftshift(fft(x_mod)).^2))/N_pdm;

% Exercice 1 - Etude du filtrage e moyenne glissante
hmg=ones(1, OS)/OS;
freqz(hmg, 1, 1e6, f_mod);
ylim([-60 10]);

% Exercice 2 - Traitement du signal PDM
ymg=filter(hmg, 1, x_mod);
yp=2*(ymg(1:OS:end)-0.5);
save('Signals/ymg.mat', 'ymg');
save('Signals/yp.mat', 'yp');

S_ymg=(abs(fftshift(fft(ymg))).^2)/N_pdm;

N_p=length(yp);
t_p=0:tout:(N_p-1)*tout;
f_p=-fout/2:fout/N_p:fout/2-fout/N_p;
S_yp=(abs(fftshift(fft(yp))).^2)/N_p;

% Exercice 3 - Analyse du signal traite
figure();
plot(f_pdm, 10*log10(X_mod));
hold on;
plot(f_pdm, 10*log10(S_ymg));
xlabel('Frequence (Hz)');
ylabel('Puissance/frequence (dB/Hz)');
title('Representation frequentielle du signal PDM');
legend('Signal PDM', 'Moyenne glissante du signal PDM');

figure();
subplot(2,1,1);
plot(t, y);
hold on;
plot(t_p, yp);
xlabel('Temps (s)');
ylabel('Amplitude (V)');
title('Representation temporelle');
legend('Signal audio', 'signal PDM traite');
subplot(2,1,2);
plot(f_s, 10*log10(X));
hold on;
plot(f_p, 10*log10(S_yp));
xlabel('Frequence (Hz)');
ylabel('Puissance/frequence (dB/Hz)');
title('Representation frequentielle');
legend('Signal audio', 'signal PDM traite');

soundsc(y, fs);
pause(N/fs+1);

soundsc(yp, fout);
