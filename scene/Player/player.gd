extends CharacterBody2D
@onready var interaction_area: Area2D = $InteractionArea # Zone pour détecter les objets proches
var max_speed = 200 # Vitesse maximale de déplacement
@onready var anim = $AnimatedSprite2D # Référence au nœud d'animation
var inventory = [] # Liste des objets collectés
var is_picking_up = false # État : vrai si le joueur est en train de ramasser un objet

var last_direction = Vector2.DOWN  # Stocke la dernière direction pour l'animation Idle

func _process(_delta):
	if is_picking_up:# Si on ramasse un objet, on arrête le mouvement
		velocity =Vector2.ZERO
		move_and_slide()
		return
	var direction = movement_vector().normalized() # Récupération du vecteur de mouvement normalisé
	velocity = direction * max_speed
	# Gestion des animations de mouvement
	if direction != Vector2.ZERO:
		last_direction = direction
		
		if direction.y < 0:
			anim.play("Walk_up")
		elif direction.y > 0:
			anim.play("Walk_down") 
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
			
	move_and_slide() # Applique le mouvement

func movement_vector(): # Calcule la direction en fonction des touches pressées
	var x = Input.get_action_strength("move_right") - Input.get_action_strength("move_left")
	var y = Input.get_action_strength("move_down") - Input.get_action_strength("move_up")
	return Vector2(x, y)

func _input(event): 
	if is_picking_up: return # Bloque les entrées pendant l'animation de ramassage
	if event.is_action_pressed("interact"):
		check_interactions()
func check_interactions():
	var areas = interaction_area.get_overlapping_areas() # Liste des zones en contact
	for area in areas:
		var target = area.get_parent()
			
		if target.has_method("collect"): # Vérifie si l'objet peut être collecté
			if anim.sprite_frames.has_animation("Pick_up"):
				is_picking_up = true
				anim.play("Pick_up")
				
				await anim.animation_finished # Attend la fin de l'animation
				is_picking_up = false
			# Ajoute l'objet à l'inventaire
			var data = {"name": target.item_name,"price": target.price}
			inventory.append(data)
			target.collect() # Détruit l'objet dans le monde
			print("Collectez: ", data.name, " Prix: ", data.price)
			break # On ne ramasse qu'un objet à la fois
		elif target.has_method("process_all_garbage"): # Vérifie si c'est la station de recyclage
				target.process_all_garbage(self)
