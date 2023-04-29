clear all;
close all;
clc;

% Paramètres généraux
fpdm=3.072e6;
OS=64;
fout=fpdm/OS;
tout=1/fout;

% Partie 2 - Implémentation d'un FIR en virgule fixe avec Matlab
%%% Chargement du signal audio
[y, fs]=audioread('bond.wav');
N_y=length(y);
t_y=0:1/fs:(N_y-1)/fs;
f_y=-fs/2:fs/N_y:fs/2-fs/N_y;
S_y=(abs(fftshift(fft(y))).^2)/N_y;
%%% Chargement du signal PDM
load('Signals/ypdm.mat');
Np=length(ypdm);
tp=0:tout:(Np-1)*tout;
f_pdm=-fpdm/2:fpdm/Np:fpdm/2-fpdm/Np;
S_ypdm=(abs(fftshift(fft(ypdm)).^2))/Np;
%%% Chargement du signal PDM filtré
load('Signals/yp.mat');
N_f=length(yp);
t_f=0:tout:(N_f-1)*tout;
f_f=-fout/2:fout/N_f:fout/2-fout/N_f;
S_yf=(abs(fftshift(fft(yp))).^2)/N_f;

%%% Chargement des coefficients du FIR
coeffs_fir=design_filter();

% Exercice 1 - Traitement PDM en entier 32 bits
yp=filter(ones(1, OS), 1, ypdm);
yp=yp(1:OS:end);
N_p=length(yp);

% Exercice 2 - Filtrage du signal PDM en virgule fixe
N_FRAC=24;
yfq=FIR_filtering(yp, coeffs_fir);
save('Signals/yfq.mat', 'yfq');

% Exercice 3 - Mise à l'échelle
scaling=@(x)(2*((double(x)-2048)/4096));

% Exercice 4 - Comparaison
yfqs=scaling(yfq);

N_fqs=length(yfqs);
t_fqs=0:tout:(N_fqs-1)*tout;
f_fqs=-fout/2:fout/N_fqs:fout/2-fout/N_fqs;
S_yfqs=(abs(fftshift(fft(yfqs))).^2)/N_fqs;

figure();
subplot(2,1,1);
plot(t_y, y);
hold on;
plot(t_f, yp);
plot(t_fqs, yfqs);
xlabel('Temps (s)');
ylabel('Amplitude (V)');
title('Représentation temporelle du signal PDM filtré');
legend('Signal audio', 'signal PDM filtré en virgule flottante', 'signal PDM filtré en virgule fixe');
subplot(2,1,2);
plot(f_y, 10*log10(S_y));
hold on;
plot(f_f, 10*log10(S_yf));
plot(f_fqs, 10*log10(S_yfqs));
xlabel('Fréquence (Hz)');
ylabel('Puissance/fréquence (dB/Hz)');
legend('Signal audio', 'signal PDM filtré en virgule flottante', 'signal PDM filtré en virgule fixe');

soundsc(y, fs);
pause(N_y/fs+1);

soundsc(scaling(yp*64), fout);
pause(N_p*tout+1);

soundsc(yp, fout);
pause(N_f*tout+1);

soundsc(yfqs, fout);