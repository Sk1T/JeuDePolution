# JeuDePolution

Author: Denys Skobalo, Artem Karelin

**JeuDePolution** est un jeu 2D développé avec **Godot 4** et **GDScript**.  
Le joueur doit explorer un environnement pollué, ramasser des déchets, gérer le poids transporté, éviter les zones dangereuses et recycler les objets pour nettoyer progressivement le monde.

## Objectif du jeu

Le but principal est de :
- collecter les déchets ;
- les transporter jusqu’à la station de recyclage ;
- augmenter la progression globale de nettoyage ;
- survivre aux zones polluées.

## Commandes

- **Déplacement** : clavier
- **Interaction** : `E`
- **Pause** : `Esc`

## Fonctionnalités principales

- menu principal avec `Play`, `Instructions` et `Quit`
- écran d’instructions
- système de collecte de déchets
- système de poids
- station de recyclage
- système de vie et dégâts
- écran de victoire
- écran de défaite
- menu pause
- paramètres audio (`Music`, `SFX`, `Mute / Unmute`)
- bouton `Replay` sur les écrans de fin

## Structure du projet

Les dossiers principaux sont :

- `scene/` : scènes principales du jeu
- `scene/Player/` : joueur et logique associée
- `scene/Level/` : niveaux jouables
- `scene/Station/` : station de recyclage
- `scene/Trashe/` : déchets récupérables
- `scene/Menu/` : éléments du menu
- `scene/WinScreen/` : écran de victoire
- `scene/DeathScreen/` : écran de défaite
- `Assets/` : ressources graphiques
- `Sounds/` : ressources sonores

## Lancer le projet

1. Ouvrir le projet avec **Godot 4**
2. Charger le fichier `project.godot`
3. Lancer la scène principale depuis l’éditeur

## Améliorations récentes

Les améliorations récentes incluent :
- stabilisation du menu principal ;
- ajout / correction de l’écran d’instructions ;
- amélioration du menu pause ;
- ajout d’un panneau de paramètres audio ;
- séparation audio entre `Music` et `SFX` ;
- ajout du bouton `Replay` sur les écrans de victoire et de défaite ;
- documentation technique et QA.

## Documentation

Le projet contient aussi les fichiers suivants :
- `QA_AUDIT.md`
- `USER_GUIDE.md`
- `DEVELOPER_GUIDE.md`

## État du projet

Le projet est jouable et possède une base fonctionnelle complète.  
Des améliorations restent possibles sur le polish visuel, les feedbacks UI et l’enrichissement général du gameplay.
