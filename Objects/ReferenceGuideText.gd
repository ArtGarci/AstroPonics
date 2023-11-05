# Christopher Adatan 10/11/23

extends RichTextLabel

# Define the text for each plant
var plant1Text = "Placeholder text for plant 1"
var plant2Text = "Placeholder text for plant 2"
var plant3Text = "Placeholder text for plant 3"
var plant4Text = "Placeholder text for plant 4"
var plant5Text = "Placeholder text for plant 5"
var plant6Text = "Placeholder text for plant 6"
var plant7Text = "Placeholder text for plant 7"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

# Called everytime one of the plant buttons are pressed. 'btn' is the corresponding button pressed.
func handleButtonPress(btn):
	# Change the ReferenceGuideText on button press
	match btn:
		"btn-1":
			self.text = plant1Text
		"btn-2": 
			self.text = plant2Text
		"btn-3":
			self.text = plant3Text
		"btn-4":
			self.text = plant4Text
		"btn-5":
			self.text = plant5Text
		"btn-6":
			self.text = plant6Text
		"btn-7":
			self.text = plant7Text
		_:
			print("undefined event")
	pass
	

func _on_plant_1_pressed(btn):
	handleButtonPress(btn)
	pass # Replace with function body.


func _on_plant_2_pressed(btn):
	handleButtonPress(btn)
	pass # Replace with function body.


func _on_plant_3_pressed(btn):
	handleButtonPress(btn)
	pass # Replace with function body.


func _on_plant_4_pressed(btn):
	handleButtonPress(btn)
	pass # Replace with function body.

func _on_plant_5_pressed(btn):
	handleButtonPress(btn)	
	pass # Replace with function body.


func _on_plant_6_pressed(btn):
	handleButtonPress(btn)	
	pass # Replace with function body.


func _on_plant_7_pressed(btn):
	handleButtonPress(btn)
	pass # Replace with function body.
