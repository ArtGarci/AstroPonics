extends Area2D

signal bucket_collision

@export var move_speed : float = 30.0
@export var move_dir : Vector2

var start_pos : Vector2
var target_pos : Vector2

# Called when the node enters the scene tree for the first time.
func _ready():
	start_pos = global_position
	target_pos = start_pos + move_dir
	var animation = get_node("AnimatedSprite2D")
	animation.play("default")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	global_position = global_position.move_toward(target_pos, move_speed * delta)
	if global_position == target_pos:
		queue_free()


func _on_body_entered(body):
	if body.is_in_group("Player"):
		emit_signal("bucket_collision")
		queue_free()
