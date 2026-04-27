# QA Audit — JeuDePolution

## 1. Menu principal / démarrage

### État actuel
- Le jeu démarre correctement sur le menu principal.
- Le menu principal contient désormais :
  - **Play**
  - **Instructions**
  - **Quit**
- Le bouton **Play** fonctionne.
- Le bouton **Quit** fonctionne.
- Un panneau **Instructions** a été ajouté et fonctionne.
- Le bouton **Back** du panneau d’instructions fonctionne correctement.
- Le joueur peut donc consulter les informations de base avant de lancer une partie.

### Problèmes identifiés (état initial)
- Le menu principal donnait initialement une impression trop minimaliste.
- Le joueur ne pouvait pas consulter les règles ou les contrôles avant de lancer la partie.
- La navigation entre menu principal et écran d’instructions n’était pas stabilisée.

### Corrections et améliorations réalisées
- Ajout du bouton **Instructions**.
- Ajout d’un panneau **InstructionsPanel**.
- Stabilisation de la logique d’ouverture/fermeture des instructions.
- Correction du bouton **Back** du panneau d’instructions.
- Clarification de l’entrée dans le jeu du point de vue utilisateur.

### Améliorations encore possibles
- Améliorer la mise en page visuelle de l’écran d’instructions.
- Ajouter éventuellement des icônes de contrôles.
- Ajouter un habillage plus homogène entre menu principal et panneaux secondaires.

**Réédité et complété par Pablo Alvarez**

---

## 2. Gameplay de base

### État actuel
- Le joueur peut se déplacer avec le clavier.
- Le joueur peut ramasser des déchets.
- L’interaction avec les objets est claire grâce à la touche **E**.
- Le poids augmente bien à l’écran lorsque le joueur ramasse des objets.
- La vitesse du joueur diminue lorsque le poids transporté augmente.

### Points positifs
- La boucle de gameplay principale est fonctionnelle :
  - se déplacer ;
  - ramasser ;
  - transporter ;
  - recycler.
- Le système de poids ajoute une contrainte pertinente.
- Le concept du gameplay principal reste lisible et cohérent avec le thème environnemental.

### Observations QA
- La base du gameplay n’a pas nécessité de réécriture structurelle.
- Les améliorations prioritaires ont surtout concerné l’interface, la navigation et le confort d’utilisation autour du gameplay déjà présent.

### Améliorations encore possibles
- Ajouter davantage de feedback visuel lors du ramassage.
- Ajouter des messages temporaires plus explicites :
  - “Trash collected!”
  - “Inventory full — recycle first!”
  - “Recycle at the station!”
- Rendre la jauge de poids plus lisible et plus explicite.

**Analyse initiale du projet collectif, rééditée par Pablo Alvarez**

---

## 3. Recyclage / objectif global

### État actuel
- La station de recyclage fonctionne.
- L’inventaire du joueur se vide correctement après recyclage.
- Le progrès global augmente après recyclage.
- Une barre de progression du nettoyage existe.
- La condition de victoire fonctionne.

### Problèmes identifiés
- Le joueur ne comprend pas toujours immédiatement que le recyclage alimente la progression globale.
- La progression pourrait être rendue plus visible et plus pédagogique.
- L’objectif global n’est pas encore suffisamment rappelé pendant la partie.

### Observations QA
- Le système principal fonctionne sur le plan logique.
- Les améliorations menées dans cette phase n’ont pas porté sur une refonte de la mécanique de recyclage elle-même, mais plutôt sur l’environnement UX autour du jeu (menu, pause, settings, replay, navigation).

### Améliorations encore possibles
- Rendre la barre de progression plus visible.
- Ajouter un texte complémentaire :
  - “World cleanup”
  - “Trash recycled”
- Ajouter un objectif affiché plus explicitement dans le HUD.
- Ajouter un feedback textuel ou visuel après recyclage.

**Analyse initiale du projet collectif, rééditée par Pablo Alvarez**

---

## 4. Dégâts / mort du joueur

### État actuel
- Les zones de pollution infligent des dégâts.
- La vie baisse correctement via les cœurs affichés à l’écran.
- Le joueur peut mourir.
- Une scène de défaite apparaît.
- L’écran de défaite possède désormais :
  - **Return to menu**
  - **Quit**
  - **Replay**

### Corrections et améliorations réalisées
- Ajout d’un bouton **Replay** sur l’écran de défaite.
- Connexion correcte du bouton à la logique de relance.
- Amélioration de la fluidité de test et de l’expérience utilisateur après échec.

### Problèmes identifiés
- Le joueur ne comprend pas toujours immédiatement la source des dégâts.
- Les zones dangereuses pourraient être mieux expliquées.
- L’écran de défaite reste fonctionnel mais encore simple visuellement.

### Améliorations encore possibles
- Ajouter un message ou effet d’alerte dans les zones polluées.
- Ajouter un feedback visuel plus fort lors des dégâts.
- Améliorer visuellement l’écran de défaite.

**Réédité et amélioré par Pablo Alvarez**

---

## 5. Victoire / fin de partie

### État actuel
- La condition de victoire fonctionne.
- Une scène de victoire apparaît.
- L’écran de victoire possède désormais :
  - **Return to menu**
  - **Quit**
  - **Replay**

### Corrections et améliorations réalisées
- Ajout d’un bouton **Replay** sur l’écran de victoire.
- Connexion correcte du bouton pour relancer rapidement une partie.
- Harmonisation logique avec l’écran de défaite.

### Intérêt de cette amélioration
- Améliore la fluidité des tests.
- Évite de devoir revenir manuellement au menu principal après chaque fin de partie.
- Donne une impression plus aboutie du projet.

### Améliorations encore possibles
- Ajouter des statistiques de fin de partie.
- Ajouter un meilleur résumé visuel des résultats.
- Ajouter une transition plus travaillée entre victoire et relance.

**Édité par Pablo Alvarez**

---

## 6. Menu pause / navigation en jeu

### État actuel
- Le menu pause fonctionne avec la touche **Esc**.
- Le menu pause contient désormais :
  - **Continue**
  - **Settings**
  - **Main Menu**
  - **Quit**
- Le bouton **Continue** fonctionne.
- Le bouton **Main Menu** fonctionne.
- Le bouton **Quit** fonctionne.
- Le bouton **Settings** ouvre correctement un panneau dédié.
- Le bouton **Back** du panneau Settings fonctionne.

### État initial observé
- Le menu pause existait déjà sous une forme minimale.
- Il était cependant incomplet et limité à une navigation très basique.

### Corrections et améliorations réalisées
- Extension du menu pause existant.
- Ajout d’un bouton **Settings**.
- Ajout d’un bouton **Main Menu**.
- Stabilisation de la logique de pause.
- Stabilisation de la navigation entre le menu pause principal et le panneau de paramètres.
- Correction des chemins de nœuds et des connexions de signaux.

### Améliorations encore possibles
- Ajouter un bouton **Restart**.
- Ajouter un habillage visuel plus riche.
- Ajouter d’autres paramètres à terme (sauvegarde, affichage, etc.).

**Réédité et amélioré par Pablo Alvarez**

---

## 7. Paramètres audio / Settings panel

### État actuel
- Un panneau **Settings** existe désormais dans le menu pause.
- Il contient :
  - un slider **Music**
  - un slider **SFX**
  - un bouton **Mute / Unmute**
  - un bouton **Back**
- Les sliders conservent visuellement leur valeur.
- Les sliders modifient effectivement les volumes des bus audio.
- Le bouton **Mute** fonctionne.
- Le bouton **Unmute** fonctionne.
- Les bus audio **Music** et **SFX** ont été créés et assignés aux bons lecteurs audio.

### Corrections et améliorations réalisées
- Création des bus :
  - **Master**
  - **Music**
  - **SFX**
- Affectation des `AudioStreamPlayer` et `AudioStreamPlayer2D` aux bons bus.
- Connexion des sliders aux fonctions de mise à jour de volume.
- Mise en place du cycle **Mute / Unmute**.
- Correction de plusieurs problèmes de signaux non connectés.
- Stabilisation du panneau de paramètres.

### Intérêt de cette amélioration
- Rend le jeu plus crédible et plus abouti.
- Donne au joueur un contrôle réel sur l’environnement sonore.
- Améliore nettement la qualité perçue du projet en soutenance.

### Améliorations encore possibles
- Ajouter une sauvegarde persistante des préférences audio.
- Ajouter un retour visuel supplémentaire sur les réglages.
- Ajouter d’autres paramètres utilisateur si nécessaire.

**Édité par Pablo Alvarez**

---

## 8. Expérience utilisateur / UX globale

### État actuel
- Le joueur dispose désormais d’un meilleur encadrement qu’au départ :
  - menu principal amélioré ;
  - écran d’instructions ;
  - pause menu enrichi ;
  - paramètres audio ;
  - replay sur écrans de fin.
- L’expérience globale paraît plus complète qu’à l’état initial.

### Progrès réalisés
- Meilleure lisibilité de l’entrée dans le jeu.
- Meilleure qualité de navigation.
- Réduction de la friction pendant les tests.
- Amélioration de la cohérence entre les écrans principaux du projet.

### Limites actuelles
- Certains feedbacks en jeu restent encore limités.
- Le guidage pendant la partie peut encore être renforcé.
- L’interface générale peut encore être polishée visuellement.

### Améliorations encore possibles
- Ajouter davantage de messages contextuels en jeu.
- Renforcer la cohérence graphique des menus et panneaux.
- Ajouter des effets de feedback plus visibles.

**Réédité et complété par Pablo Alvarez**

---

## 9. Bugs / stabilité

### État actuel
- Le projet est désormais beaucoup plus stable sur les parcours testés.
- Les transitions principales testées fonctionnent :
  - menu principal ;
  - lancement de partie ;
  - pause ;
  - settings ;
  - retour menu ;
  - défaite ;
  - victoire ;
  - replay.
- Plusieurs erreurs précédentes ont été corrigées :
  - mauvais script attaché à une mauvaise scène ;
  - héritage incorrect (`Node2D` / `CanvasLayer`) ;
  - signaux non connectés ;
  - chemins de nœuds erronés ;
  - confusion entre scènes de menu.

### Travail QA réellement effectué
- Vérification manuelle des scènes principales.
- Nettoyage de modifications automatiques inutiles de Godot (`.import`, `.uid`, etc.) côté Git.
- Corrections incrémentales en branche dédiée.
- Validation manuelle des flux critiques.

### Points à surveiller encore
- Comparer la branche QA avec la version la plus récente du projet collectif avant intégration.
- Vérifier qu’aucun conflit n’apparaît avec d’éventuelles modifications du groupe.
- Continuer la stabilisation si d’autres scènes sont enrichies.

**Édité par Pablo Alvarez**

---

## Synthèse globale

Le projet possédait déjà une base jouable et cohérente, mais l’expérience restait incomplète sur plusieurs points visibles : menu principal trop simple, instructions inaccessibles, pause menu minimal, paramètres absents, navigation limitée sur les écrans de fin.

L’audit QA et les corrections menées ont permis d’obtenir les améliorations concrètes suivantes :

1. Stabilisation du **menu principal**.
2. Mise en place d’un **écran d’instructions fonctionnel**.
3. Correction du bouton **Back** des instructions.
4. Extension du **menu pause** avec :
   - Continue
   - Settings
   - Main Menu
   - Quit
5. Création d’un **Settings panel** opérationnel.
6. Mise en place de **bus audio séparés** :
   - Music
   - SFX
7. Activation réelle des **sliders audio**.
8. Mise en place de **Mute / Unmute**.
9. Ajout d’un bouton **Replay** sur l’écran de défaite.
10. Ajout d’un bouton **Replay** sur l’écran de victoire.
11. Amélioration globale de la qualité perçue et de la fluidité de démonstration.

### Priorités désormais
- Finaliser la documentation du projet.
- Préparer le rapport final.
- Préparer la soutenance avec captures avant / après.
- Comparer proprement la branche QA avec la version collective avant toute intégration.

Ce QA audit sert donc de base technique et méthodologique pour justifier les améliorations réalisées, structurer la documentation et défendre l’apport individuel dans le cadre du projet.

**Réédité et finalisé par Pablo Alvarez**
