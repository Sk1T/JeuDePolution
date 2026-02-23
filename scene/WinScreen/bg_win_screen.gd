extends ParallaxBackground

var speed = 100 # Vitesse de défilement du décor


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	scroll_offset.x -= speed * delta # Déplace le défilement horizontal en fonction de la vitesse et du temps

	
