extends CharacterBody2D

signal health_changed(new_health: int)
signal died

#exports
@export var base_speed: float = 150.0
@export var max_weight: float = 10.0
@export var ui_node: CanvasLayer
#onready
@onready var interaction_area: Area2D = $InteractionArea # Zone pour détecter les objets proches
@onready var anim = $AnimatedSprite2D # Référence au nœud d'animation
@onready var interact_prompt = $InteractPrompt
@onready var step_snd = $StepSound
@onready var pickup_snd = $PickupSound
#variablies
var current_speed: float = 150.0 # Vitesse maximale de déplacement
var last_direction = Vector2.DOWN  # Stocke la dernière direction pour l'animation Idle
var inventory = [] # Liste des objets collectés
var current_weight: float = 0.0
var is_picking_up = false # État : vrai si le joueur est en train de ramasser un objet
var alive: bool = true
var max_health: int #max player health
var health: int #current player health



func _ready() -> void:
	PlayerStats.reset()
	health = PlayerStats.health
	max_health = PlayerStats.max_health #loading health
	
	if interact_prompt:
		interact_prompt.hide()


func update_speed():
	var load_factor = current_weight/ max_weight
	current_speed = base_speed * (1.0 -(load_factor*0.4))
func _process(_delta):
	if not alive: 
		step_snd.stop()
		return #stops processes after death
	update_interact_visuals()
	if is_picking_up:# Si on ramasse un objet, on arrête le mouvement
		velocity =Vector2.ZERO
		move_and_slide()
		return
	var direction = movement_vector().normalized() # Récupération du vecteur de mouvement normalisé
	velocity = direction * current_speed
	# Gestion des animations de mouvement
	if direction != Vector2.ZERO:
		last_direction = direction
		
		if direction.y < 0:
			anim.play("Walk_Up")
		elif direction.y > 0:
			anim.play("Walk_Down") 
		else:
			anim.play("Walk") 
		# Inversion du sprite pour la gauche/droite
		if direction.x < 0:
			anim.flip_h = false # Regarde à gauche
		elif direction.x > 0:
			anim.flip_h = true # Regarde à droite (miroir)
	else:
		# Gestion des animations d'arrêt (Idle)
		if last_direction.y < 0:
			anim.play("Up_Idle")
		elif last_direction.y > 0:
			anim.play("Down_Idle") 
		else:
			anim.play("Idle")
	if velocity != Vector2.ZERO and not is_picking_up:
		if not step_snd.playing:
			step_snd.play()
	else:
		step_snd.stop()
	move_and_slide() # Applique le mouvement

func update_interact_visuals():
	if not alive or is_picking_up:
		interact_prompt.hide()
		return
	var areas = interaction_area.get_overlapping_areas()
	var can_interact = false
	
	for area in areas:
		var target = area.get_parent()
		if target.has_method("collect") or target.has_method("process_all_garbage"):
			can_interact = true
			break
	if can_interact:
		interact_prompt.show()
	else:
		interact_prompt.hide()

func movement_vector(): # Calcule la direction en fonction des touches pressées
	var x = Input.get_action_strength("move_right") - Input.get_action_strength("move_left")
	var y = Input.get_action_strength("move_down") - Input.get_action_strength("move_up")
	return Vector2(x, y)

func _input(event):
	if not alive: return #stops animation after death 
	if is_picking_up: return # Bloque les entrées pendant l'animation de ramassage
	if event.is_action_pressed("interact"):
		check_interactions()
func check_interactions():
	if not alive: return
	var areas = interaction_area.get_overlapping_areas() # Liste des zones en contact
	for area in areas:
		var target = area.get_parent()
			
		if target.has_method("collect"): # Vérifie si l'objet peut être collecté
			if current_weight + target.weight > max_weight:
				print("Trop Lourd!!! Tout d'abord recycler les déchetes actuels")
				return
				
			if pickup_snd:
				pickup_snd.play()
			   
			 
			if anim.sprite_frames.has_animation("Pick_Up"):
				is_picking_up = true
				interact_prompt.hide()
				anim.play("Pick_Up")
				
				await anim.animation_finished # Attend la fin de l'animation
				is_picking_up = false
			# Ajoute l'objet à l'inventaire
			current_weight+= target.weight
			update_speed()
			if ui_node:
				ui_node.update_weight(current_weight, max_weight)
			var data = {"name": target.item_name,"price": target.price, "weight": target.weight }
			inventory.append(data)
			target.collect() # Détruit l'objet dans le monde
			print("Collectez: ", data.name, " Prix: ", data.price,"  Weight: ",current_weight, "/", max_weight)
			break # On ne ramasse qu'un objet à la fois
		elif target.has_method("process_all_garbage"): # Vérifie si c'est la station de recyclage
				target.process_all_garbage(self)
				update_speed()

func take_damage(amount: int) -> void:
	if alive:
		health -= amount
		PlayerStats.health = health
		emit_signal("health_changed", health)
		if health <= 0:
			die()

func die() -> void:
	alive = false
	velocity = Vector2.ZERO
	interact_prompt.hide()
	anim.play("Death") #adding death animation
	await anim.animation_finished
	died.emit()
