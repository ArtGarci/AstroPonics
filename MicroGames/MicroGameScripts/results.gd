extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready():
	var my_label = get_node("Label")
	my_label.text = "Final Score: " + str(Global.microGameScore)
