#  depot-STM32-Traitement-Son 

> La documentation du projet est disponible [ici](https://tanguy-rdt.github.io/depot-ensta-STM32-Traitement-Son/presentation/presentation.html)
>
> _Si le format html n'est plus disponible, les sources sont dans le dossier 'doc'_



## Présentation du projet

Au cours des 30 créneaux dédiés au projet il nous a été demandé d'enregistrer un son de quelques secondes sur la carte STM32 fourni via un micro MEMS et le rejouer sur des hauts-parleurs via le DAC.


## Utilisation

#### Flashage de la carte

1. À partir de _CubeIDE_ : \
  Vous pouvez directement cloner notre dépôt puis l’ouvrir à l’aide de CubeIDE. Si vous utilisez le même matériel dans ce cas aucun changement n’est nécessaire, il suffit de connecter la carte à votre PC via le périphérique ST-Link et de flasher la carte.

2. À partir des binaires : \
   Connecter la carte à votre pc via le périphérique ST-Link, ce qui devrait vous faire apparaitre un nouveau stockage. Si c’est le cas, il suffit de placer les binaires dans ce stockage comme si on le mettait sur une clé USB.

#### Enregistrement et diffusion

Une fois que la carte est flashée, l’enregistrement démarre automatiquement. Si vous n’avez pas eu le temps d’enregistrer votre son, vous pouvez appuyer sur le bouton reset pour relancer le programme. Quand vous êtes satisfait de l’enregistrement, il ne reste plus qu’à appuyer sur le _user button_ pour lancer l’audio. 


## Release

- __v2.0.0__: \
  Seconde version, décimation avec la fonction __builtin_popcount() et filtrage des composantes hautes fréquences du signal PCM

- __v1.0.1__: \
  Amélioration du code suite aux commentaires retenus lors de la présentation 

- __v1.0.0__: \
  Première version fonctionnelle, une simple décimation avec la fonction __builtin_popcount()
