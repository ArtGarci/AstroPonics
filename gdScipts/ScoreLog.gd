extends Node


var log_panel: Panel
var log_label: RichTextLabel

func _ready():
	log_panel = $Panel  # Adjust the path based on your scene structure
	#log_label = log_panel.get_node("LogLabel")
	log_panel.hide()
	

func toggle_log_panel():
	# Toggle the visibility of the log panel
	log_panel.visible = not log_panel.visible

