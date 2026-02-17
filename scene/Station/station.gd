extends Node2D

@export var goal_price: int = 100 # Combien faut-il collecter pour gagner 
var current_total: int = 0      # Quelle quantité a déjà été traitée 

func process_all_garbage(player):
	# Si l'inventaire du joueur est vide
	if player.inventory.size() == 0:
		print("Vous n'avez aucun déchet à recycler !")
		return
	# On vide l'inventaire et on ajoute les points au score total
	for item in player.inventory:
		current_total += item["price"]
	
	player.inventory.clear() # Vider l'inventaire du joueur
	
	print("Progrès global : ", current_total, " / ", goal_price)
	
	check_win_condition()

func check_win_condition(): # Vérifie si le score atteint l'objectif
	if current_total >= goal_price:
		win_game()

func win_game():
	print("VICTOIRE ! La planète est propre !")
	# Ici, vous pouvez changer de scène :
	# get_tree().change_scene_to_file("res://WinScreen.tscn")
	# Ou mettez simplement le jeu en pause :
	# get_tree().paused = true
