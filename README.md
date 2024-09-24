# Pygmy-RobotWall-Detector
PygmyRobot réalise un parcours entre les murs.
Dans cette réalisation le robot doit parcourir quatre chicanes et s'arrêter au trait noir.
Sachant que le Raspberry Pi ne détecte  que des signaux logiques (0 ou 1) il faut bien comprendre le fonctionnement du capteur. Le circuit des capteurs est composé d'une diode infra-rouge (SFH4554), un phototransistor (LTR4206).

Le phototransistor  doit être utilisé  en émetteur commun et
avec une résistance connectée à la masse. De la valeur de cette résistance dépend la distance à laquelle le capteur va basculer de 0 à 1.
Normalement c'est 2,2K pour une distance de 39mm, avec 1k on a 24mm de même avec 390 ohms la distance est de 9mm. C'est la résistance de 1k qui a été choisie pour le capteur central. Pour les deux capteurs latéraux c'estune résistance de  5k qui est utilisée et la distance de détection est alors de 5cm.

Au départ le capteur central est à 0 et les deux capteur latéraux sont à 1 : le robot avance. Quand il rencontre un mur le capteur central passe à 1 le capteur de droite passe à 0 et celui de gauche reste à 1 : le robot tourne à droite et à gauche et s'arrête jusqu'à rencontrer la surface noire.

Particularité, la propulsion est assurée par deux servomoteurs à rotation continue. 

( primitives Python pour Pygmy Forth )

" Tempo.fth" LOAD ( temporisation 1 sec )

" ServoAV.fth" LOAD ( marche avant )

" ServoAR.fth" LOAD ( marche arrière )

" ServoStop.fth" LOAD ( arrêt )

" TurnDW90.fth" LOAD ( tourne à droite de 90° )

" TurnGL90.fth" LOAD ( tourne à gauche de 90° )

" initlf1.fth" LOAD ( capteur de droite )

" initlf2.fth" LOAD ( capteur du centre )

" initlf3.fth" LOAD ( capteur de gauche )

" initlf4.fth" LOAD ( capteur à photorésistance qui stoppe au trait noir )


( ServoPropulsion applications )
: TOPWD ( - - )

BEGIN ( commence la boucle )

INITLF2 0= IF SERVOAV ELSE SERVOSTOP ( lit le capteur central 0 loint 1 proche )

THEN  ( fin du branchement conditionnel )

INITLF2 INITLF3 AND IF TURNDW90 (si le capteur central et (AND) le capteur gauche sont tous les deux à 1 on tourne à droite de 90°)

THEN ( fin du branchement conditionnel )

INITLF2 INITLF1 AND IF TURNGL90 (si le capteur central et (AND) le capteur de droite sont tous les deux à 1 on tourne à gauche de
THEN ( fin du branchement conditionnel )

INITLF4 NOT UNTIL ;( fin du programme si 0 est lu  

( contrôle)

: t INITLF1 ." droite-jaune" . CR INITLF2 ." centre-vert" . CR INITLF3  ." gauche-blanc" . CR INITLF4  ." stop-jaune" .  CR  ;

WORDS  CR


https://github.com/user-attachments/assets/67bafb0a-ee2a-4c65-b06e-490bff4566da





![RobotWd](https://github.com/user-attachments/assets/72c96cec-64aa-4d07-a386-767e28dbd2b2)
