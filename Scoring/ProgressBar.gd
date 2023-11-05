extends ProgressBar


var score_label
var max_health : int = 100
func _ready():
	score_label = get_node("ScoreLabel")  # Update with the correct path to your score label

func _on_value_changed(value):
	var health = int(value * max_health)
	update_score(health)

func update_score(health):
	score_label.text = "Score: " + str(health)
