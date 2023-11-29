extends Label


# Called when the node enters the scene tree for the first time.
func _ready():
	if Global.microGameScore != 0 and Global.microGameType != "":
		set_score(Global.microGameType, Global.microGameScore)
	else:
		pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	

#sets Score
func set_score(message,score):
	
	#update UI text
	var labelText =get_tree().get_root().get_node("Game2/ScoreBoxBackground/ScoreLabel")
	GlobalScoreLog.POINTS += score
	labelText.text = "Score: " + str(GlobalScoreLog.POINTS)
	
	#call function in the score log script to update score log
	GlobalScoreLog.add_log_entry(message, score)
	
