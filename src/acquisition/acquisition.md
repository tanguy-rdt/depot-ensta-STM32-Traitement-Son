# Acquisition 

- [Acquisition](#acquisition)
  - [PDM](#pdm)
  - [SAI](#sai)
  - [DMA](#dma)
  - [Pratique](#pratique)

## Le PDM 

Le PDM (_Pulse-Density modulation_) soit modulation par densité d'impulsions est utilisé pour réprésenter un signal analogique en signal binaire. Le principe est le suivant, on a un signal audio sous sa forme analogique que l'on va chercher à enregistrer. Pour cela, on va coder chaque échantillon du signal sur un seul bit. Chaque échantillon est quantifiée à une valeur. Si l'échantillon (postion n) à une valeur inférieure à léchantillon précédent (position n-1) alors son bit sera codé à 0, sinon si sa valeur est supérieure alors son bit sera codé à 1. C'est donc une comparaison à chaque instant d'échantillonage avec le précédent qui permettra de moduler notre signal audio. Cette méthode à un nom, la modulation Delta. 

Pour mieux visualiser, voici un schéma explicatif :

![](./img/PDM_signal.png)


## SAI

Le SAI (_Serial Audio Interface_) est une interface permettant au microcontrôleur de communiquer avec plusieurs dispositifs audio externes dont les microphones. Sur le STM32, le SAI a une interface PDM dédiée, ce qui permet directement d'acquérir un signal audio en entrée. Pour notre projet, c'est donc cette interface qui nous intéresse. Si on veut acquérir un signal audio, il faut donc que notre microphone soit connecté au SAI en configuration mono et mode de réception maître. 

Voici le schéma de connection d'un microphone en mode mono sur l'interface SAI :

![](./img/Schema_SAI.png)

La broche nommée _LR_ sur le schéma ci-dessus est une broche de sélection de canal du microphone qui peut être connectée soit à Vdd, soit à GND. En fonction du canal selectionné, on choisit si le microphone émet les données sur les fronts montants ou descendant de l'horloge. Le front d'échantillonnage de l'horloge SAI doit être configuré en conséquence. Selon la documentation (voir ci-dessous), on a le choix entre 16 KHz ou 48 KHz pour _Fe_, nous avons fait le choix de 48 KHz puisque cela nous induit une meilleure qualité audio. Le front d'échantillonage de l'horloge SAI sera donc de 3.072 MHz. 

![](./img/Front_Echantillonage.png)
 
Les échantillons audio en entrée sont acquis par broche de sortie de données (DOUT) du microphone numérique via la broche de données série (SD), sur le schéma ci-dessous on voit que c'est la sortie PE6. 

![](./img/Broche_SD.png)

## DMA


## Pratique 