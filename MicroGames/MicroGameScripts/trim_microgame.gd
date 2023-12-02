extends Node2D

var score = 0
var scoreLabel
var timeRemaining = 10
var timerLabel

# Called when the node enters the scene tree for the first time.
func _ready():
	scoreLabel = get_node("score_label")
	timerLabel = get_node("timer_label")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _get_random_position():
	var rand_x = randf_range(0, get_viewport().size.x-100)
	return Vector2(rand_x, 20)

func _on_timer_timeout():
	pass


func _on_countdown_timer_timeout():
	if timeRemaining == 0:
		Global.microGameScore = score
		Global.microGameType = "Trim Minigame"
		get_tree().change_scene_to_file('res://MicroGames/MicroGameScenes/results.tscn')
		return
	timeRemaining -= 1
	timerLabel.text = "%d" % timeRemaining


func _on_plant_plant_clicked():
	score += 1
	scoreLabel.text = "Score: %d" % score
