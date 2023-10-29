extends Node2D

var plantLoad = preload("res://scenes/my_plant.tscn")

func _process(delta):
	global_position = get_global_mouse_position()
	
	
	if Input.is_action_just_pressed("click"):
		self.show()
		


func _on_trowel_area_area_entered(area):
	if Global.itTrowel == true:
		if area.name == "trashArea":
			Global.seedSelected = 0
			Global.lightLevel = 0
			Global.itTrowel = false
			Global.mouseClick = false
			var getArea = area.get_parent()
			getArea = getArea.get_parent()
			getArea = getArea.get_path()
			get_node(getArea).hide()
			self.queue_free()
			
# used for testing
func isVisbale():
	return self.is_visible()
	
func whatIsSeed():
	return Global.seedSelected
	
func lightLevel():
	return Global.lightLevel
	
func isItTrowel():
	return Global.itTrowel
