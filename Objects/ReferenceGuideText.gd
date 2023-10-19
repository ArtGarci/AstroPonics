# Christopher Adatan 10/11/23

extends RichTextLabel

var plant_buttons = self.get_children()

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func handle_button_pressed(selected_button):
	# make all buttons untoggled except for selected button
	var buttons = self.get_children()
	for button in buttons: 
		if button == selected_button:
			continue
		# Untoggle the button
		button.set("toggle", "false")

# Change the text of the reference guide to reflect the current plant characteristics
# Plant 1 reference text loading
func _on_plant_1_toggled(button_pressed):
	print("Plant 1 button pressed.")
	pass # Replace with function body.

# Plant 2 reference text loading
func _on_plant_2_toggled(button_pressed):
	print("Plant 2 button pressed.")
	pass # Replace with function body.

# Plant 3 reference text loading
func _on_plant_3_toggled(button_pressed):
	print("Plant 3 button pressed.")
	pass # Replace with function body.

# Plant 4 reference text loading
func _on_plant_4_toggled(button_pressed):
	print("Plant 4 button pressed.")
	pass # Replace with function body.

# Plant 5 reference text loading
func _on_plant_5_toggled(button_pressed):
	print("Plant 5 button pressed.")
	pass # Replace with function body.

# Plant 6 reference text loading
func _on_plant_6_toggled(button_pressed):
	print("Plant 6 button pressed.")
	pass # Replace with function body.

# Plant 7 reference text loading
func _on_plant_7_toggled(button_pressed):
	print("Plant 7 button pressed.")
	pass # Replace with function body.
