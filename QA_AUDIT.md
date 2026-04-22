# QA Audit — JeuDePolution

## 1. Arranque / Menu

### État actuel
- Le jeu démarre bien sur un menu principal.
- Le menu est fonctionnel mais très simple : il contient seulement **Play** et **Quit**.
- Le bouton **Play** fonctionne.
- Le bouton **Quit** fonctionne.
- Il n’existe pas de bouton **Instructions**, **Controls** ou **How to Play**.
- L’objectif est expliqué au début du jeu, mais il n’y a pas de menu dédié pour rappeler les contrôles ou le but du jeu.

### Problèmes identifiés
- Le menu principal donne une impression de prototype.
- Le joueur ne peut pas consulter les règles ou les contrôles avant de lancer la partie.
- L’expérience utilisateur manque d’encadrement au lancement.

### Améliorations proposées
- Ajouter un bouton **How to Play**.
- Ajouter un écran ou une fenêtre d’instructions.
- Ajouter les contrôles principaux :
  - Déplacement : clavier
  - Interaction : touche E
  - Objectif : collecter les déchets et les recycler
  - Danger : éviter les zones polluées
- Ajouter éventuellement un bouton **Settings** ou **Difficulty**.

---

## 2. Gameplay de base

### État actuel
- Le joueur peut se déplacer avec le clavier.
- Le joueur peut ramasser des déchets.
- L’interaction avec les objets est claire grâce à la touche **E**.
- Le poids augmente bien à l’écran lorsque le joueur ramasse des objets.
- La vitesse du joueur diminue lorsque le poids transporté augmente.

### Points positifs
- La boucle de gameplay principale fonctionne :
  - se déplacer ;
  - ramasser ;
  - transporter ;
  - recycler.
- Le système de poids ajoute une contrainte intéressante au joueur.

### Améliorations proposées
- Ajouter plus de feedback visuel au moment du ramassage.
- Ajouter un message temporaire du type :
  - “Trash collected!”
  - “Inventory full — recycle first!”
  - “Recycle at the station!”
- Rendre la jauge de poids plus lisible et plus intuitive.

---

## 3. Recyclage / Objectif global

### État actuel
- La station de recyclage fonctionne.
- L’inventaire du joueur se vide correctement après recyclage.
- Le progrès global augmente après recyclage.
- Une barre de nettoyage du monde existe, mais elle reste peu intuitive.
- Il existe un délai d’environ quelques secondes entre le recyclage et l’augmentation visible de la progression.
- La condition de victoire fonctionne, mais elle n’est pas assez claire pendant la partie.

### Problèmes identifiés
- Le joueur ne comprend pas toujours immédiatement que le recyclage augmente la progression globale.
- Le délai entre l’action de recycler et la mise à jour de la barre peut donner l’impression que le système ne fonctionne pas.
- La barre de progression n’est pas suffisamment mise en valeur.
- L’objectif global n’est pas rappelé pendant la partie.

### Améliorations proposées
- Rendre la barre de nettoyage plus visible.
- Ajouter un texte clair :
  - “World cleanup: 0 / 100”
  - “Trash recycled: X”
- Réduire ou supprimer le délai d’actualisation après recyclage.
- Ajouter un message de feedback :
  - “Recycled +20 cleanup points”
- Ajouter un objectif visible en jeu :
  - “Objective: clean the planet by recycling trash.”

---

## 4. Dégâts / Mort du joueur

### État actuel
- Les zones de pollution infligent bien des dégâts.
- La vie baisse correctement via les cœurs affichés à l’écran.
- Le joueur peut mourir.
- Il existe une animation de mort : le personnage tombe au sol et clignote.
- Une scène de défaite apparaît avec le message :
  - “Defeat, you have failed. Try again.”

### Problèmes identifiés
- Le joueur perd de la vie, mais il ne comprend pas toujours immédiatement pourquoi.
- Les zones dangereuses ne sont pas suffisamment expliquées.
- L’animation de mort existe mais pourrait être rendue plus claire.
- L’écran de défaite est fonctionnel mais basique.

### Améliorations proposées
- Ajouter un message lorsque le joueur entre dans une zone polluée :
  - “Warning: polluted area!”
- Ajouter un effet visuel léger lorsque le joueur prend des dégâts.
- Améliorer l’écran de défaite avec :
  - bouton **Restart**
  - bouton **Main Menu**
  - rappel de l’objectif.
- Ajouter une meilleure transition entre la mort et l’écran Game Over.

---

## 5. Expérience utilisateur / UX

### État actuel
- Le joueur ne comprend pas entièrement quoi faire sans explication externe.
- Il existe un message au début et un message à la fin.
- Entre les deux, les messages sont très limités.
- Un message existe lorsque l’inventaire est plein.
- Les sons sont présents.
- Le menu pause fonctionne, mais reste basique : seulement **Continue** et **Quit**.

### Problèmes identifiés
- Le jeu manque de guidage pendant la partie.
- Le joueur n’a pas assez d’informations sur :
  - l’objectif ;
  - le danger ;
  - le recyclage ;
  - la progression.
- Le menu pause pourrait être plus complet.
- L’interface donne une impression de démo plutôt que de jeu finalisé.

### Améliorations proposées
- Ajouter des messages contextuels.
- Ajouter un vrai menu pause avec :
  - Continue
  - Restart
  - Controls
  - Quit to Menu
- Ajouter un menu d’instructions.
- Ajouter éventuellement un choix de difficulté :
  - Easy
  - Normal
  - Hard
- Ajouter des feedbacks sonores ou visuels plus visibles.

---

## 6. Bugs / Stabilité

### État actuel
- Aucun bug bloquant observé pendant le test.
- Aucun message d’erreur rouge visible dans la console Godot.
- Les scènes principales chargent correctement.
- Les boutons principaux fonctionnent.
- Les animations principales fonctionnent globalement.

### Points à surveiller
- Le système de recyclage semble avoir un délai avant la mise à jour de la progression.
- L’animation de recyclage pourrait être améliorée.
- Le joueur ne dispose pas encore d’une animation spécifique lorsqu’il recycle.
- Le jeu reste très simple et manque de profondeur.

### Améliorations proposées
- Ajouter une animation du joueur pendant le recyclage.
- Ajouter une meilleure synchronisation entre recyclage et progression.
- Vérifier les transitions entre :
  - menu principal ;
  - jeu ;
  - pause ;
  - défaite ;
  - victoire.
- Ajouter plus d’éléments interactifs ou d’objectifs secondaires.

---

## Synthèse globale

Le jeu possède déjà une base fonctionnelle : menu, déplacement, collecte, poids, recyclage, vie, dégâts, victoire et défaite. Cependant, l’expérience reste encore trop simple et manque de guidage utilisateur.

Les priorités d’amélioration sont :

1. Améliorer le menu principal avec un écran d’instructions.
2. Rendre l’objectif du jeu plus clair pendant la partie.
3. Améliorer la barre de progression globale.
4. Ajouter plus de feedback visuel et textuel.
5. Améliorer le menu pause.
6. Ajouter des options comme Restart, Main Menu, Controls et éventuellement Difficulty.
7. Documenter le projet pour répondre au cahier des charges.

Ce QA audit servira de base pour organiser les prochaines améliorations du projet et justifier les choix de développement dans le rapport et la soutenance.