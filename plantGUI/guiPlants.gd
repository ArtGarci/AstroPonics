extends MarginContainer

var SEEDPREVIEW = preload("res://scenes/drag_seed.tscn")
var lettaceImg = preload("res://images/seedtmp1.png")
var SPEED = 200
var seedSelected = 0 # 1=lettace 2=radish 3=chives 4=potatoes 5=wheat 6=tomatoes
var lightLevel = 0 #1=low,2=high

func _on_button_for_menu_pressed():
	get_node("seedMenu").show()

func _on_exit_button_pressed():
	get_node("seedMenu").hide()

func _ready():
	pass

func _on_lettace_seed_gui_input(event):
	if event is InputEventMouseButton:
		Global.seedSelected = 1
		Global.lightLevel = 1
		var seedPreview = SEEDPREVIEW.instantiate()
		seedPreview.set_position(event.position)
		get_node("seedDrag").add_child(seedPreview) # change to pots when made
		get_node("seedMenu").hide()
		get_node("trashBin").show()
		

func _on_radish_seed_gui_input(event):
	if event is InputEventMouseButton:
		Global.seedSelected = 2
		Global.lightLevel = 1
		var seedPreview = SEEDPREVIEW.instantiate()
		seedPreview.set_position(event.position)
		get_node("seedDrag").add_child(seedPreview) # change to pots when made
		get_node("seedMenu").hide()
		get_node("trashBin").show()


func _on_chives_seed_gui_input(event):
	if event is InputEventMouseButton:
		var seedPreview = SEEDPREVIEW.instantiate()
		seedPreview.set_position(event.position)
		get_node("seedDrag").add_child(seedPreview) # change to pots when made
		get_node("seedMenu").hide()
		get_node("trashBin").show()
		Global.seedSelected = 3
		Global.lightLevel = 1


func _on_potatoes_seed_gui_input(event):
	if event is InputEventMouseButton:
		var seedPreview = SEEDPREVIEW.instantiate()
		seedPreview.set_position(event.position)
		get_node("seedDrag").add_child(seedPreview) # change to pots when made
		get_node("seedMenu").hide()
		get_node("trashBin").show()
		Global.seedSelected = 4
		Global.lightLevel = 2


func _on_wheat_seed_gui_input(event):
	if event is InputEventMouseButton:
		var seedPreview = SEEDPREVIEW.instantiate()
		seedPreview.set_position(event.position)
		get_node("seedDrag").add_child(seedPreview) # change to pots when made
		get_node("seedMenu").hide()
		get_node("trashBin").show()
		Global.seedSelected = 5
		Global.lightLevel = 2


func _on_tomatoes_seeds_gui_input(event):
	if event is InputEventMouseButton:
		var seedPreview = SEEDPREVIEW.instantiate()
		seedPreview.set_position(event.position)
		get_node("seedDrag").add_child(seedPreview) # change to pots when made
		get_node("seedMenu").hide()
		get_node("trashBin").show()
		Global.seedSelected = 6
		Global.lightLevel = 2


