extends Node

#Score Log Script Global



var log_history = []
var log_panel: Panel
var log_label: RichTextLabel

func _ready():
	log_panel = $Panel  # Adjust the path based on your scene structure
	#log_label = log_panel.get_node("LogLabel")
	log_panel.hide()
	
func add_log_entry(message, points):
	var entry = {"message": message, "points": points}
	log_history.append(entry)

	# Update the UI
	update_ui()

func update_ui():
	# Update the Label text with the log entries
	for entry in log_history:
		log_label.text += entry["message"] + ": " + str(entry["points"]) + "\n"

func toggle_log_panel():
	# Toggle the visibility of the log panel
	log_panel.visible = not log_panel.visible

