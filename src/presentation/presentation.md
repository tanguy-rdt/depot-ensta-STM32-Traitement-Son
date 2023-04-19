# Presentation

## Explication du projet

Au cours des 30 créneaux dédiés au projet il nous a été demandé de réussir à enregistrer un son de quelques secondes sur la carte STM32 fournie via un micro MEMS et le rejouer sur des hauts-parleurs via le DAC.

## Materiel

Pour mener à bien ce projet, nous avons utilisé une carte STM32F4290I-DISC1, un micro PDM, une sortie Jack, un casque, et le logiciel STM32CubeIDE.

## Utilisation

Pour tester le projet, vous aurez besoin du materiel cité précédemment. Suivez les instructions suivantes :

- Connectez la carte STM32 à votre pc via le periphérique ST-Link et lancer le logiciel STM32CubeIDE.
- Ouvrez le projet récupérable sur le git et flashez la carte avec le code main.c
- Connectez le haut parleur ou le casque audio sur les pin.
- Appuyez sur le bouton noir pour lancer/recommencer l'enregistrement, puis appuyez sur le bouton bleu pour le jouer.
