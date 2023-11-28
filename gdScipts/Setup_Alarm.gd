extends Sprite2D

var tween 

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

func animate() -> void:
	if (tween): # tweens are not designed to be re-used 
		tween.kill() # abort 
	tween = get_tree().create_tween().set_parallel(true)
	tween.tween_property(self, "position", self.position, 1)
	tween.tween_property(self, "scale", Vector2(1,1), 1).set_ease(Tween.EASE_OUT)
	tween.tween_property(self, "rotation_degrees", 360, 1).as_relative()
	tween.tween_property(self, "scale", Vector2(3,3), 1).set_ease(Tween.EASE_OUT)
	tween.play()
	
func animate_away():
	if (tween): # tweens are not designed to be re-used 
		tween.kill() # abort 
	tween = get_tree().create_tween() # binds object w/ tween 
	tween.bind_node(self) # .set_trans(Tween.TRANS_ELASTIC)
	tween.tween_property(self, "modulate", Color.RED, 1).set_trans(Tween.TRANS_SINE)
	tween.tween_property(self, "scale", Vector2(), 1).set_trans(Tween.TRANS_BOUNCE)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
