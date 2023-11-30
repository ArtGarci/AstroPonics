extends Sprite2D

var tween
var sprite 

# Called when the node enters the scene tree for the first time.
func _ready():
	tween = create_tween() # first tweem
	sprite = $PH_UI

# this animation shows to the user PH got changed!
func callAnimation() -> void:
	if (tween): # tweens are not designed to be re-used 
		tween.kill() # abort 
	# todo make more smoother
	# binds object w/ tween
	tween = create_tween().set_parallel(true)
	for sprite in get_children():
		tween.tween_property(sprite, "position", Vector2(0,0), 1)
		tween.tween_property(sprite, "modulate", Color.RED, 1).set_trans(Tween.TRANS_SINE)
		tween.tween_property(sprite, "rotation_degrees", -45, 1).as_relative()
		tween.tween_property(sprite, "position", Vector2(100, 200), 1).set_trans(Tween.TRANS_BOUNCE)
		tween.tween_property(sprite, "position", Vector2(100, 400), 1).set_trans(Tween.TRANS_BOUNCE)
		tween.tween_property(sprite, "scale", Vector2(), 1).set_trans(Tween.TRANS_BOUNCE)
	tween.tween_property(self, "modulate", Color.RED, 1).set_trans(Tween.TRANS_SINE)
	tween.tween_property(self, "rotation_degrees", -45, 1).as_relative()
	tween.tween_property(self, "position", Vector2(100, 200), 1).set_trans(Tween.TRANS_BOUNCE)
	tween.tween_property(self, "position", Vector2(100, 400), 1).set_trans(Tween.TRANS_BOUNCE)
	tween.tween_property(self, "scale", Vector2(), 1).set_trans(Tween.TRANS_BOUNCE)
	tween.play()
	await tween.finished
	tween.tween_callback(callAnimation) # loop 
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
