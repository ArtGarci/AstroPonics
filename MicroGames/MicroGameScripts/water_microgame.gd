extends Node2D

var water_drop = preload("res://MicroGames/MicroGameScenes/water_drop.tscn")
var score = 0
var scoreLabel
var timeRemaining = 30
var timerLabel

# Called when the node enters the scene tree for the first time.
func _ready():
	var water_drop = get_node("WaterDrop")
	scoreLabel = get_node("score_label")
	timerLabel = get_node("timer_label")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _get_random_position():
	var rand_x = randf_range(0, get_viewport().size.x-100)
	return Vector2(rand_x, 20)

func _on_timer_timeout():
	var instance = water_drop.instantiate()
	instance.position = _get_random_position()
	add_child(instance)
	instance.connect("bucket_collision", Callable(self, "_on_collision"))
	
func _on_collision():
	score += 1
	scoreLabel.text = "Score: %d" % score

func _on_countdown_timer_timeout():
	if timeRemaining == 0:
		Global.microGameScore = score
		Global.microGameType = "Water Minigame"
		get_tree().change_scene_to_file('res://MicroGames/MicroGameScenes/results.tscn')
		return
	timeRemaining -= 1
	timerLabel.text = "%d" % timeRemaining
