extends Button

var score_label
# Called when the node enters the scene tree for the first time.
func _ready():
	score_label = get_node("../ScoreLabel")  # Update with the correct path to your Score Label
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_pressed():
	# Find the HealthBar node and get its current health value
	#var health_bar = get_node('../ProgressBar')  # Update with the correct path to your HealthBar
	#var health = health_bar.value
	
	# Calculate the score based on the remaining health
	
	#var score = int(health * health_bar.max_health)

	# Find the Score Label node and set the updated score
	if score_label != null:
		print("found")
	else:
		print("not found")
	#score_label.set_score(score)
	
