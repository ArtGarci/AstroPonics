# Christopher Adatan 10/11/23

extends RichTextLabel

# Define the text for each plant
var lettuceTextLabel = "Lettuce (grows in 8 weeks)\n
It is most often grown as a leaf vegetable, but sometimes for its stem and seeds. 
Lettuce is most often used for salads, although it is also seen in other kinds of food, such as soups, sandwiches and wraps; it can also be grilled.
"
var radishTextLabel = "Radishes (grows in 4 weeks)\n
The radish (Raphanus raphanistrum subsp. sativus) is an edible root vegetable of the family Brassicaceae that was domesticated in Asia prior to Roman times.
Radishes are grown and consumed throughout the world, being mostly raw as a crunchy salad vegetable with a pungent, slightly spicy flavor, varying in intensity depending on its growing environment. 
"
var chivesTextLabel = "Chives (grows in 4 weeks)\n
Chives are a commonly used herb and can be found in grocery stores or grown in home gardens. 
In culinary use, the green stalks (scapes) and the unopened, immature flower buds are diced and used as an ingredient for omelettes, fish, potatoes, soups, and many other dishes.
"
var potatoTextLabel = "Potatoes (grows in 12 weeks)\n
Potatoes were introduced to Europe from the Americas by the Spanish in the second half of the 16th century. Potatoe are a staple food in many parts of the world and an integral part of much of the world's food supply. Following millennia of selective breeding, there are now over 5,000 different types of potatoes. Over 99% of potatoes presently cultivated worldwide descend from varieties that originated in the lowlands of south-central Chile. 
"
var tomatoTextLabel = "Tomatoes (grows in 12 weeks)\n
Tomatoes are a significant source of umami flavor. They are consumed in diverse ways: raw or cooked, and in many dishes, sauces, salads, and drinks. While tomatoes are fruits—botanically classified as berries—they are commonly used culinarily as a vegetable ingredient or side dish.
"
var wheatTextLabel = "Wheat (grows in 8 weeks)\n
Common wheat (Triticum aestivum), also known as bread wheat, is a cultivated wheat species. About 95% of wheat produced worldwide is common wheat; it is the most widely grown of all crops and the cereal with the highest monetary yield.
"

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
			self.text = lettuceTextLabel
		"btn-2": 
			self.text = radishTextLabel
		"btn-3":
			self.text = chivesTextLabel
		"btn-4":
			self.text = potatoTextLabel
		"btn-5":
			self.text = tomatoTextLabel
		"btn-6":
			self.text = wheatTextLabel
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
