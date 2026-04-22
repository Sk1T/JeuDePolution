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