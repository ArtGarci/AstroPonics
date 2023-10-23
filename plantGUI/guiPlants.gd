extends MarginContainer

var SEEDPREVIEW = preload("res://scenes/drag_seed.tscn")
var TROWELPREVIEW = preload("res://scenes/trowel.tscn")
var seedSelected = 0 # 1=lettace 2=radish 3=chives 4=potatoes 5=wheat 6=tomatoes
var lightLevel = 0 #1=low,2=high
var mouseClick = false # true seed following mouse
var mouseEntered = false
var itSeed = false
var itTrowel = false

# when seed bag is pressed the seed menu is shown
func _on_button_for_menu_pressed():
	get_node("seedMenu").show()

# when the exit button is pressed on seed menu the menu disappears
func _on_exit_button_pressed():
	get_node("seedMenu").hide()

func _ready():
	pass

# top left button on menu
func _on_lettace_seed_gui_input(event):
	# check to see if the event it a click
	if event is InputEventMouseButton:
		Global.seedSelected = 1			# global seed is set
		Global.lightLevel = 1			# gloabal light level is set
		Global.itSeed = true
		Global.mouseClick = true
		var seedPreview = SEEDPREVIEW.instantiate()		# make instance of the see image
		seedPreview.set_position(event.position)		# set position to mouse location
		get_node("seedDrag").add_child(seedPreview)		# makes new instance of seed
		get_node("seedMenu").hide()
		get_node("trashBin").show()						# show trash bin
		

func _on_radish_seed_gui_input(event):
	if event is InputEventMouseButton:
		Global.seedSelected = 2			# global seed is set
		Global.lightLevel = 1			# gloabal light level is set
		Global.itSeed = true
		Global.mouseClick = true
		var seedPreview = SEEDPREVIEW.instantiate()		# make instance of the see image
		seedPreview.set_position(event.position)		# set position to mouse location
		get_node("seedDrag").add_child(seedPreview)		# makes new instance of seed
		get_node("seedMenu").hide()						# hide seed menu
		get_node("trashBin").show()						# show trash bin


func _on_chives_seed_gui_input(event):
	if event is InputEventMouseButton:
		Global.seedSelected = 3			# global seed is set
		Global.lightLevel = 1			# gloabal light level is set
		Global.itSeed = true
		Global.mouseClick = true
		var seedPreview = SEEDPREVIEW.instantiate()		# make instance of the see image
		seedPreview.set_position(event.position)		# set position to mouse location
		get_node("seedDrag").add_child(seedPreview) 	# maes a new instance of seed
		get_node("seedMenu").hide()						# hide seed menu
		get_node("trashBin").show()						# show trash bin


func _on_potatoes_seed_gui_input(event):
	if event is InputEventMouseButton:
		Global.seedSelected = 4			# global seed is set
		Global.lightLevel = 2			# gloabal light level is set
		Global.itSeed = true
		var seedPreview = SEEDPREVIEW.instantiate()		# make instance of the see image
		seedPreview.set_position(event.position)		# set position to mouse location
		get_node("seedDrag").add_child(seedPreview) 	# maes a new instance of seed
		get_node("seedMenu").hide()						# hide seed menu
		get_node("trashBin").show()						# show trash bin


func _on_wheat_seed_gui_input(event):
	if event is InputEventMouseButton:
		Global.seedSelected = 5			# global seed is set
		Global.lightLevel = 2			# gloabal light level is set
		Global.itSeed = true
		Global.mouseClick = true
		var seedPreview = SEEDPREVIEW.instantiate()		# make instance of the see image
		seedPreview.set_position(event.position)		# set position to mouse location
		get_node("seedDrag").add_child(seedPreview) 	# maes a new instance of seed
		get_node("seedMenu").hide()						# hide seed menu
		get_node("trashBin").show()						# show trash bin


func _on_tomatoes_seeds_gui_input(event):
	if event is InputEventMouseButton:
		Global.seedSelected = 6			# global seed is set
		Global.lightLevel = 2			# gloabal light level is set
		Global.itSeed = true
		Global.mouseClick = true
		var seedPreview = SEEDPREVIEW.instantiate()		# make instance of the see image
		seedPreview.set_position(event.position)		# set position to mouse location
		get_node("seedDrag").add_child(seedPreview) 	# maes a new instance of seed
		get_node("seedMenu").hide()						# hide seed menu
		get_node("trashBin").show()						# show trash bin



func _on_texture_button_gui_input(event):
	if event is InputEventMouseButton:
		Global.itTrowel = true
		var trowelPreview = TROWELPREVIEW.instantiate()
		trowelPreview.set_position(event.position)		# set position to mouse location
		get_node("seedDrag").add_child(trowelPreview) 	# maes a new instance of seed
		get_node("seedMenu").hide()						# hide seed menu
		get_node("trashBin").show()						# show trash bin
