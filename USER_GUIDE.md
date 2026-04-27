# USER GUIDE — JeuDePolution / Nature’s Last Stand

## 1. Présentation du jeu
JeuDePolution / Nature’s Last Stand est un jeu 2D vu de dessus dans lequel le joueur doit nettoyer un environnement pollué.

Le principe général du jeu repose sur :
- l’exploration ;
- la collecte de déchets ;
- la gestion du poids transporté ;
- le recyclage ;
- la survie dans des zones dangereuses.

**Statut : Existant**

---

## 2. Objectif principal
L’objectif du joueur est de ramasser les déchets présents dans le niveau puis de les recycler afin d’augmenter la progression globale du nettoyage.

Pour réussir, il faut :
- collecter les déchets ;
- éviter de trop se surcharger ;
- retourner à la station de recyclage au bon moment ;
- survivre aux zones polluées.

**Statut : Existant**

---

## 3. Commandes principales
### Déplacement
Le personnage se déplace avec le clavier.

### Interaction
La touche **E** permet d’interagir avec les objets et les stations.

### Pause
La touche **Esc** ouvre le menu pause.

**Statut : Existant**

---

## 4. Menu principal
Le menu principal permet de :
- lancer la partie avec **Play** ;
- ouvrir le panneau **Instructions** ;
- quitter le jeu avec **Quit**.

Le panneau d’instructions permet au joueur de mieux comprendre le jeu avant de commencer.

**Statut : Modifié **

---

## 5. Instructions
Le panneau **Instructions** a été ajouté / stabilisé pour permettre au joueur de consulter rapidement :
- le but du jeu ;
- les commandes principales ;
- la logique de collecte et de recyclage.

Le bouton **Back** permet de revenir au menu principal.

**Statut : Modifié **

---

## 6. Gameplay principal
La boucle de jeu principale est la suivante :

1. explorer la zone ;
2. ramasser des déchets ;
3. transporter les déchets ;
4. surveiller le poids ;
5. aller à la station ;
6. recycler ;
7. augmenter la progression du nettoyage.

**Statut : Existant**

---

## 7. Système de poids
Chaque déchet ramassé ajoute du poids au personnage.

Quand le poids augmente :
- le personnage devient plus lent ;
- le joueur doit mieux gérer ses déplacements ;
- il devient plus risqué de rester trop longtemps loin de la station.

Ce système oblige le joueur à faire des choix et rend la collecte plus stratégique.

**Statut : Existant**

---

## 8. Recyclage
Le recyclage est une étape essentielle du jeu.

Quand le joueur atteint la station de recyclage :
- les déchets sont retirés de l’inventaire ;
- la progression globale augmente ;
- le joueur peut repartir collecter d’autres déchets.

**Statut : Existant**

---

## 9. Santé et danger
Le joueur possède une barre / un système de santé visible à l’écran.

Certaines zones polluées infligent des dégâts.  
Si la santé atteint zéro, le joueur perd la partie et l’écran de défaite apparaît.

**Statut : Existant**

---

## 10. Menu pause
Pendant la partie, le joueur peut ouvrir le menu pause avec **Esc**.

Le menu pause contient maintenant :
- **Continue**
- **Settings**
- **Main Menu**
- **Quit**

Cela permet de mieux contrôler la navigation pendant la partie.

**Statut : Modifié **

---

## 11. Settings audio
Le panneau **Settings** du menu pause contient :
- un slider **Music** ;
- un slider **SFX** ;
- un bouton **Mute / Unmute** ;
- un bouton **Back**.

Le joueur peut donc :
- baisser ou augmenter la musique ;
- baisser ou augmenter les effets sonores ;
- couper puis restaurer rapidement le son.

Ces réglages sont maintenant reliés à de vrais bus audio séparés.

**Statut : Créé / amélioré a l'audit**

---

## 12. Écran de défaite
Lorsque le joueur meurt, l’écran de défaite apparaît.

Il contient :
- **Return to menu**
- **Quit**
- **Replay**

Le bouton **Replay** permet de relancer rapidement une partie.

**Statut : Modifié **

---

## 13. Écran de victoire
Lorsque la progression de nettoyage est terminée, l’écran de victoire apparaît.

Il contient :
- **Return to menu**
- **Quit**
- **Replay**

Le bouton **Replay** permet également de relancer rapidement une partie après la victoire.

**Statut : Modifié **

---

## 14. Parcours conseillé pour tester le jeu
Pour tester rapidement les fonctionnalités principales :

1. ouvrir le jeu ;
2. consulter le menu principal ;
3. ouvrir **Instructions** ;
4. revenir au menu avec **Back** ;
5. lancer la partie avec **Play** ;
6. se déplacer ;
7. ramasser des déchets ;
8. recycler ;
9. ouvrir le menu pause avec **Esc** ;
10. tester **Settings** ;
11. modifier **Music** et **SFX** ;
12. tester **Mute / Unmute** ;
13. revenir avec **Back** ;
14. continuer la partie ;
15. tester un écran de fin ;
16. utiliser **Replay**.

**Statut : Créé a l'audit**

---

## 15. Limites actuelles
Le jeu est maintenant plus lisible et plus agréable à utiliser, mais certaines améliorations restent possibles :
- plus de feedback visuel en jeu ;
- plus de messages contextuels ;
- une interface encore plus homogène ;
- une sauvegarde persistante des paramètres audio.

**Statut : Modifié**

---

## 16. Légende
- **Existant** : élément déjà présent dans le projet collectif initial.
- **Modifié ** : élément existant retravaillé, corrigé ou amélioré par Pablo Alvarez.
- **Créé / amélioré a l'audit ** : élément ajouté ou fortement développé pendant l’audit QA et les améliorations personnelles par Pablo Alvarez.

Le développement initial du projet, de ses bases de gameplay et de sa structure principale provient du groupe de développeurs d’origine.  
Les éléments marqués comme modifiés, créés ou améliorés correspondent à l’intervention personnelle de **Pablo Alvarez** dans le cadre de la branche QA et du travail d’amélioration du projet.
