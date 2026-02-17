extends Node2D

@export var item_name: String = "iron_can" # Nom de l'objet
@export var price: int = 10 #valeur conditionnelle des déshetes
func collect():# Désactive les collisions pour éviter de collecter l'objet deux fois
	$Area2D.set_deferred("monitoring", false)
	$Area2D.set_deferred("monitorable", false)
	
	# on peut ajouter ici le son de collection
	queue_free() # Supprime l'objet de la scène
