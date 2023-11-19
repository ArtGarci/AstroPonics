extends Label


# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	

#sets Score
func set_score(message,score):
	
	#update UI text
	text = "Score: " + str(score)
	#call function in the score log script to update score log
	GlobalScoreLog.add_log_entry(message, score)
	
