# Christopher Adatan 10/11/23

extends RichTextLabel

# Define the text for each plant
var lettuceTextLabel = "Lettuce 
Growth time: 8 weeks
Recommended pH level: 6.0–6.5

Physical Traits: Lettuce is a leafy green vegetable with tender, mild-flavored leaves, often crisp and varying in color from pale green to deep red or purple.

Food Description: Tossed with cherry tomatoes, cucumber slices, Kalamata olives, and a Greek feta dressing, this lettuce transforms into a refreshing Greek salad, showcasing its crisp texture and serving as the perfect base for a light and flavorful dish.
"
var radishTextLabel = "Radishes
Growth time: 4 weeks
Recommended pH level: 6.5 - 7.0

Physical Traits: Radishes are small, round or elongated root vegetables with a vibrant red or pink skin and crisp, white flesh.

Food Description: Sliced thinly and nestled atop a bed of arugula, feta cheese, and a zesty lemon vinaigrette, these radishes add a refreshing crunch and peppery kick to a vibrant spring salad, creating a perfect balance of flavors and textures.
"
var chivesTextLabel = "Chives
Growth time: 4 weeks
Recommended pH level: 6.0 - 7.0

Physical Traits: Chives are slender, green, hollow stems with a mild onion flavor and a delicate, grass-like appearance.

Food Description: Whisked into a creamy sour cream and mayo blend, freshly chopped chives add a burst of freshness to classic baked potato toppings, creating a savory and tangy loaded baked potato dish that's both comforting and flavorful.
"
var potatoTextLabel = "Potatoes
Growth time: 12 weeks
Recommended pH level: 6.0 - 6.5

Physical Traits: The vegetable is starchy with a brownish, slightly rough skin, and a soft, white or yellowish flesh.

Food Description: Sliced thinly and crisped to perfection, these potatoes transform into irresistible homemade potato chips, seasoned with a blend of sea salt, rosemary, and a hint of garlic, offering a delightful and crunchy snack for any occasion.
"
var tomatoTextLabel = "Tomatoes
Growth time: 12 weeks
Recommended pH level: 6.2 - 6.8

Physical Traits: The vegetable is small, round, and typically red, with a smooth outer skin and juicy, pulpy flesh containing numerous seeds.

Food Description: When sliced and combined with fresh basil, mozzarella cheese, and a drizzle of balsamic glaze, these tomatoes make a delectable Caprese salad, showcasing their vibrant flavors and enhancing the overall dish.
"
var wheatTextLabel = "Wheat
Growth time: 8 weeks
Recommended pH level: 6.5

Physical Traits: Wheat is a cereal grain with slender, golden-brown stalks and kernels, typically harvested for its versatile and nutritious grains.

Food Description: Ground into flour and kneaded into a dough, wheat becomes the heart of a classic baguette, achieving a golden-brown crust and airy interior, perfect for sandwiches or as a side to complement a variety of meals.
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
	return btn
	

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
