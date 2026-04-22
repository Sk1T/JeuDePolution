# Documentation utilisateur — JeuDePolution

## 1. Présentation du jeu

**JeuDePolution** est un jeu 2D développé avec Godot dans le cadre du projet en autonomie de Licence Informatique à l’Université Lyon 2.

Le joueur incarne un personnage chargé de nettoyer une zone polluée. L’objectif est de ramasser les déchets présents sur la carte, de les rapporter à la station de recyclage, puis de remplir progressivement la barre de nettoyage du monde.

Le thème du jeu est lié au dérèglement climatique et à la sensibilisation environnementale : le joueur comprend que la pollution a un impact direct sur l’environnement et que le recyclage permet d’améliorer l’état du monde.

---

## 2. Objectif du jeu

L’objectif principal est de nettoyer entièrement la zone.

Pour gagner, le joueur doit :

1. Se déplacer dans le niveau.
2. Ramasser les déchets.
3. Faire attention à la limite de poids transportable.
4. Aller à la station de recyclage.
5. Recycler les déchets collectés.
6. Remplir la barre de progression globale.
7. Éviter les zones dangereuses de pollution.

Lorsque l’objectif de nettoyage est atteint, une scène de victoire apparaît.

---

## 3. Commandes

| Action | Touche / Interaction |
|---|---|
| Se déplacer vers le haut | W / Flèche haut |
| Se déplacer vers le bas | S / Flèche bas |
| Se déplacer à gauche | A / Flèche gauche |
| Se déplacer à droite | D / Flèche droite |
| Interagir / ramasser / recycler | E |
| Menu pause | Échap |
| Boutons de menu | Souris |

---

## 4. Interface utilisateur

L’interface affiche plusieurs informations importantes :

- **La vie du joueur**, représentée par des cœurs.
- **Le poids transporté**, qui augmente lorsque le joueur ramasse des déchets.
- **La progression globale du nettoyage**, qui montre l’avancement vers la victoire.
- **Des messages contextuels**, par exemple lorsque l’inventaire est plein ou lorsqu’un objet peut être récupéré.

---

## 5. Système de poids

Chaque déchet possède un poids.

Lorsque le joueur ramasse des déchets, son poids transporté augmente. Plus le poids est élevé, plus le joueur devient lent. Cela oblige le joueur à faire des choix et à retourner régulièrement à la station de recyclage.

Si le poids maximal est atteint, le joueur doit recycler ses déchets avant de pouvoir en ramasser d’autres.

---

## 6. Recyclage

La station de recyclage permet de vider l’inventaire du joueur.

Lorsque le joueur interagit avec la station :

- Les déchets collectés sont traités.
- Le poids transporté revient à zéro.
- La vitesse du joueur est restaurée.
- La progression globale augmente.
- La barre de nettoyage se met à jour.

---

## 7. Danger et défaite

Certaines zones polluées sont dangereuses.

Si le joueur reste dans une zone de pollution, il perd progressivement de la vie. Lorsque sa vie atteint zéro, une animation de mort se lance et une scène de défaite apparaît.

Le joueur doit donc nettoyer la zone tout en évitant de rester trop longtemps dans les zones dangereuses.

---

## 8. Conditions de fin

Le jeu possède deux fins principales :

### Victoire

Le joueur gagne lorsque la progression globale du nettoyage atteint l’objectif fixé.

### Défaite

Le joueur perd lorsque sa vie atteint zéro.

---

## 9. Conseils pour jouer

- Commencer par ramasser les déchets les plus proches.
- Retourner souvent à la station de recyclage.
- Éviter de rester dans les zones polluées.
- Surveiller la barre de poids.
- Utiliser la progression globale pour savoir combien il reste à nettoyer.

---

## 10. Limites observées et améliorations possibles

L’audit QA a identifié plusieurs améliorations possibles :

- Ajouter un menu d’instructions plus clair.
- Rendre la barre de nettoyage plus intuitive.
- Ajouter davantage de feedback visuel pendant le recyclage.
- Clarifier les zones de danger.
- Ajouter un bouton Restart.
- Ajouter un choix de difficulté.
- Ajouter plus de messages en cours de partie.

Ces points servent de base pour les prochaines améliorations du projet.