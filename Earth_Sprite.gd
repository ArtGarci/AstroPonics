extends Sprite2D
var rotation_speed = 0.0001

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	rotation += rotation_speed
