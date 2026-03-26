extends Node

var max_health: int = 100 #max player health
var health: int = 100 #current player health

func reset() -> void:
	health = max_health
