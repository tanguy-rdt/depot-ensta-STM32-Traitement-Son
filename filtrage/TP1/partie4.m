clear all;
close all;
clc;

% Param�tres g�n�raux
fpdm=3.072e6;
OS=64;
fout=fpdm/OS;
tout=1/fout;

% Partie 4 - Filtrage passe-bas du signal PDM
%%% Chargement du signal audio
[y, fs]=audioread('bond.wav');
N_y=length(y);
t_y=0:1/fs:(N_y-1)/fs;
f_y=-fs/2:fs/N_y:fs/2-fs/N_y;
S_y=(abs(fftshift(fft(y))).^2)/N_y;
%%% Chargement du signal PDM
load('Signals/x_mod.mat');
Np=length(x_mod);
tp=0:tout:(Np-1)*tout;
f_pdm=-fpdm/2:fpdm/Np:fpdm/2-fpdm/Np;
S_ypdm=(abs(fftshift(fft(x_mod)).^2))/Np;
%%% Chargement du signal PDM trait�
load('Signals/yp.mat');
N_p=length(yp);
t_p=0:tout:(N_p-1)*tout;
f_p=-fout/2:fout/N_p:fout/2-fout/N_p;
S_yp=(abs(fftshift(fft(yp))).^2)/N_p;

% Exercice 1 - Conception du filtre passe-bas
hlp=createFIRFilter();

% Exercice 2 - Filtrage du signal PDM trait�
yf=filter(hlp, 1, yp);
save('Signals/yf.mat', 'yf');

% Exercice 3 - Analyse du r�sultat du filtrage
N_f=length(yf);
t_f=0:tout:(N_f-1)*tout;
f_f=-fout/2:fout/N_f:fout/2-fout/N_f;
S_yf=(abs(fftshift(fft(yf))).^2)/N_f;

figure();
subplot(2,1,1);
plot(t_y, y);
hold on;
plot(t_p, yp);
plot(t_f, yf);
xlabel('Temps (s)');
ylabel('Amplitude (V)');
title('Representation temporelle du signal');
legend('Signal audio', 'signal PDM traite', 'signal PDM filtre');
subplot(2,1,2);
plot(f_y, 10*log10(S_y));
hold on;
plot(f_p, 10*log10(S_yp));
plot(f_f, 10*log10(S_yf));
xlabel('Frequence (Hz)');
ylabel('Puissance/frequence (dB/Hz)');
title('Representation frequentielle du signal');
legend('Signal audio', 'signal PDM traite', 'signal PDM filtre');

soundsc(y, fs);
pause(N_y/fs+1);

soundsc(yp, fout);
pause(N_p/fout+1);

soundsc(yf, fout);
