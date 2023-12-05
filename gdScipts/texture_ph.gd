extends TextureRect

var tween
var target_texture

# Called when the node enters the scene tree for the first time.
func _ready():
	tween = create_tween()
	target_texture = load("res://Art and textures/ph_attack.png")
	self.material.set("ph_dissolve/weight", 0)
	self.material.set("ph_dissolve/target_texture", target_texture)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
