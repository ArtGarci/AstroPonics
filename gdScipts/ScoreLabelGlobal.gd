extends Label


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	

#sets Score
func _set_score(message,score):
	
	#update UI text
	text = "Score: " + str(score)
	#call function in the score log script to update score log
	#ScoreLog.add_new_entry(message, score)
	
