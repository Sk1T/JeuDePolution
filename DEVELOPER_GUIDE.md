# Documentation développeur — JeuDePolution

## 1. Présentation technique

**JeuDePolution** est un jeu 2D développé avec **Godot 4** et le langage **GDScript**.

Le projet repose sur une structure simple :
- un menu principal ;
- plusieurs niveaux ;
- un joueur contrôlable au clavier ;
- des objets déchets récupérables ;
- une station de recyclage ;
- une interface affichant le poids, la vie et la progression de nettoyage ;
- des scènes de victoire et de défaite.

L’objectif technique est de proposer un jeu lisible, jouable et cohérent avec la thématique du dérèglement climatique.

---

## 2. Organisation du projet

Les principaux dossiers du projet sont :

| Dossier / fichier | Rôle |
|---|---|
| `scene/` | Contient les scènes principales du jeu |
| `scene/Player/` | Contient le joueur, ses animations et sa logique |
| `scene/Level/` | Contient les niveaux jouables |
| `scene/Station/` | Contient la station de recyclage |
| `scene/Trashe/` | Contient les déchets récupérables |
| `scene/Menu/` | Contient le menu principal |
| `scene/WinScreen/` | Contient l’écran de victoire |
| `scene/DeathScreen/` | Contient l’écran de défaite |
| `Assets/` | Contient les ressources graphiques |
| `Sounds/` | Contient les ressources sonores |
| `project.godot` | Configuration principale du projet |

---

## 3. Scripts principaux

### `player.gd`

Ce script gère le joueur.

Fonctionnalités principales :
- déplacement au clavier ;
- gestion des animations ;
- collecte des déchets ;
- gestion du poids transporté ;
- ralentissement du joueur selon le poids ;
- interaction avec la station ;
- gestion de la vie ;
- mort du joueur.

Variables importantes :
- `base_speed` : vitesse de base du joueur ;
- `max_weight` : poids maximum transportable ;
- `inventory` : liste des déchets collectés ;
- `current_weight` : poids actuellement transporté ;
- `health` : vie actuelle du joueur ;
- `alive` : indique si le joueur est vivant.

---

### `station.gd`

Ce script gère la station de recyclage.

Fonctionnalités principales :
- vérifie si le joueur possède des déchets ;
- additionne la valeur des déchets collectés ;
- vide l’inventaire du joueur ;
- remet le poids du joueur à zéro ;
- met à jour l’interface ;
- vérifie si la condition de victoire est atteinte.

Variables importantes :
- `goal_price` : objectif de nettoyage à atteindre ;
- `current_total` : progression actuelle du nettoyage.

---

### `hud.gd`

Ce script gère l’interface utilisateur.

Fonctionnalités principales :
- affichage de la vie ;
- affichage du poids transporté ;
- mise à jour des éléments visuels de l’interface.

---

### `polution_area.gd`

Ce script gère les zones dangereuses de pollution.

Fonctionnalités principales :
- détecte quand le joueur entre dans une zone polluée ;
- applique des dégâts au joueur à intervalles réguliers ;
- arrête les dégâts lorsque le joueur sort de la zone.

---

### Scripts des déchets

Les scripts des déchets définissent :
- le nom de l’objet ;
- son poids ;
- sa valeur ;
- sa méthode de collecte.

Exemples :
- `glass_bottle.gd`
- `Iron_can.gd`
- `box_of_pizza.gd`
- `newspapers.gd`
- `tire.gd`

---

## 4. Boucle de gameplay

La boucle principale du jeu est la suivante :

1. Le joueur démarre dans un niveau pollué.
2. Il se déplace avec le clavier.
3. Il repère les déchets dans le niveau.
4. Il interagit avec les déchets pour les ramasser.
5. Le poids transporté augmente.
6. La vitesse du joueur diminue si le poids augmente.
7. Le joueur retourne à la station de recyclage.
8. Les déchets sont recyclés.
9. La progression globale augmente.
10. Lorsque l’objectif est atteint, la scène de victoire est affichée.

---

## 5. Système de poids

Le système de poids permet de rendre le gameplay plus stratégique.

Chaque déchet possède un poids. Le joueur ne peut pas dépasser sa capacité maximale.

Si le joueur transporte trop d’objets :
- il doit retourner à la station ;
- il ne peut pas ramasser certains déchets supplémentaires ;
- sa vitesse est réduite.

Ce système donne une contrainte de gestion et évite que le joueur puisse tout ramasser sans réfléchir.

---

## 6. Système de vie et pollution

Le joueur possède une barre de vie représentée par des cœurs.

Lorsqu’il entre dans une zone polluée :
- un timer se déclenche ;
- le joueur reçoit des dégâts régulièrement ;
- la vie diminue ;
- si la vie atteint zéro, une animation de mort se joue ;
- l’écran de défaite apparaît.

Ce système renforce le lien entre le gameplay et la thématique environnementale.

---

## 7. Conditions de victoire et de défaite

### Victoire

Le joueur gagne lorsque la progression de nettoyage atteint l’objectif défini dans la station.

Exemple :
```gdscript
if current_total >= goal_price:
	win_game()

### Défaite

Le joueur perd lorsque sa vie atteint zéro.

Exemple :

```gdscript
if health <= 0:
	die()

---

## 8. Points faibles identifiés

Un audit QA a été réalisé afin d’identifier les limites actuelles du projet.

Points à améliorer :
- menu principal trop simple ;
- manque d’écran d’instructions clair ;
- feedback visuel insuffisant pendant le recyclage ;
- barre de nettoyage peu intuitive ;
- zone de pollution pas assez expliquée au joueur ;
- menu pause basique ;
- manque de paramètres comme la difficulté ou le redémarrage rapide.

Ces points sont listés dans le fichier `QA_AUDIT.md`.

---

## 9. Pistes d’amélioration

Améliorations prioritaires :
- ajouter un menu d’instructions ;
- améliorer la lisibilité de la barre de nettoyage ;
- afficher des messages contextuels pendant la partie ;
- ajouter un bouton Restart ;
- améliorer le menu pause ;
- ajouter une sélection de difficulté ;
- rendre les zones polluées plus explicites ;
- ajouter plus de niveaux ou objectifs secondaires.

---

## 10. Commandes Git utiles

Voir l’état du projet :

```bash
git status

## 11. Menu principal et instructions

Le menu principal du projet a été enrichi et stabilisé.

## Éléments disponibles
- `Play`
- `Instructions`
- `Quit`

## Logique actuelle
Le script du menu principal gère :
- le lancement du niveau principal ;
- l’ouverture du panneau d’instructions ;
- le retour au menu via le bouton `Back` ;
- la sortie du jeu.

## Intérêt technique
Cette amélioration permet :
- une meilleure entrée utilisateur dans le jeu ;
- une structure de navigation plus propre ;
- une meilleure lisibilité pour une démonstration ou une soutenance.

Scripts/scènes concernés :
- `scene/menu.tscn`
- `scene/Menu/menu.gd`

---

## 12. Menu pause

Un menu pause plus complet a été mis en place pendant l’audit.

## Structure actuelle
Le menu pause contient :
- `Continue`
- `Settings`
- `Main Menu`
- `Quit`

## Fichier principal
- `scene/pause_menu.tscn`
- `pause_menu.gd`

## Logique technique
Le menu pause s’ouvre avec `Esc` et permet :
- de reprendre la partie ;
- d’ouvrir les paramètres ;
- de revenir au menu principal ;
- de quitter le jeu.

## Point technique important
Une correction a été nécessaire sur les chemins de nœuds, notamment entre :
- `$VBoxContainer`
- et `$Background/VBoxContainer`

Sans ce correctif, certaines actions provoquaient des erreurs de type `null instance`.

---

## 13. Paramètres audio

Le projet possède maintenant un panneau `Settings` fonctionnel dans le menu pause.

### Contenu du panneau
- `MusicSlider`
- `SFXSlider`
- `MuteButton`
- `BackSettings`

## Fonctionnement
- `MusicSlider` modifie le volume du bus `Music`
- `SFXSlider` modifie le volume du bus `SFX`
- `MuteButton` coupe les deux catégories de son
- `Unmute` restaure les valeurs précédentes
- `BackSettings` retourne au menu pause

## Architecture audio ajoutée
Des bus audio séparés ont été créés :
- `Master`
- `Music`
- `SFX`

Les lecteurs audio ont ensuite été répartis correctement entre :
- musiques de menu / victoire / défaite → `Music`
- effets sonores et interactions → `SFX`

## Intérêt technique
Cette séparation rend enfin possibles de vrais paramètres utilisateur.

---

## 14. Écrans de fin et replay

Les écrans de défaite et de victoire ont été améliorés.

## Death screen
Fichiers concernés :
- `scene/DeathScreen/death_screen.tscn`
- `scene/DeathScreen/death_screen.gd`

Amélioration ajoutée :
- bouton `Replay`

## Win screen
Fichiers concernés :
- `scene/WinScreen/win_screen.tscn`
- `scene/WinScreen/win_screen.gd`

Amélioration ajoutée :
- bouton `Replay`

## Intérêt
Le replay permet :
- de tester plus rapidement ;
- d’améliorer l’expérience utilisateur ;
- de rendre le projet plus fluide en démonstration.

---

## 15. Signaux et points de vigilance

Pendant l’audit, plusieurs erreurs ont montré l’importance des signaux dans Godot.

### Points à surveiller
- bouton présent dans la scène mais signal non connecté ;
- bouton renommé sans mise à jour de la logique ;
- confusion entre plusieurs scènes de menu ;
- script attaché au mauvais type de nœud (`Node2D` / `CanvasLayer`) ;
- connexions en double ou oubliées.

## Exemple concret
Le bouton `Back` des instructions ne fonctionnait pas car son signal n’était pas connecté.
Le problème ne venait pas du code métier, mais de la scène et de la connexion du signal.

## Recommandation
Toujours vérifier :
- le nom réel du nœud ;
- le script attaché ;
- le type du nœud ;
- les connexions de signaux dans la scène.

---

## 16. Recommandations pour la suite

Les améliorations les plus utiles à poursuivre seraient :
- sauvegarde persistante des paramètres audio ;
- ajout d’un bouton `Restart` dans le menu pause ;
- plus de feedbacks UI pendant la partie ;
- meilleure lisibilité de la progression de nettoyage ;
- harmonisation visuelle supplémentaire ;
- comparaison finale entre la branche QA et la branche principale avant intégration.
