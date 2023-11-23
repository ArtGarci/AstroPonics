extends Node

var log_history :=[]
var max_log_entries := 5
var POINTS = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func add_log_entry(message, points):
	var entry = {"message": message, "points": points}
	log_history.append(entry)
	
	# Limit the number of entries
	while log_history.size() > max_log_entries:
		log_history.remove_at(0)

	# Update the UI
	update_ui()

func update_ui():
	# Iterate over scenes and update UI accordingly
		var log_label = get_tree().get_root().get_node("Game2/ScoreLog/Panel/LogLabel")
		if log_label:
			# Clear the Label text
			log_label.text = ""
			
			# Update the Label text with the log entries
		for entry in log_history:
			log_label.text += entry["message"] + ": " + str(entry["points"]) + " Points	" + "\n"
