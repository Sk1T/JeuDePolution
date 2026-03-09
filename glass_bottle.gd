extends Node2D

@export var item_name: String = "Glass bottle" # Nom de l'objet
@export var price: int = 20 #valeur conditionnelle des déshetes
@export var weight: float = 2
func collect():# Désactive les collisions pour éviter de collecter l'objet deux fois
	$Area2D.set_deferred("monitoring", false)
	$Area2D.set_deferred("monitorable", false)
	
	# on peut ajouter ici le son de collection
	queue_free() # Supprime l'objet de la scène
