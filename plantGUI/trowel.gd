extends Node2D

var plantLoad = preload("res://scenes/my_plant.tscn")

func _process(delta):
	global_position = get_global_mouse_position()
	
	
	if Input.is_action_just_pressed("click"):
		self.show()
		


func _on_trowel_area_area_entered(area):
	if Global.itTrowel == true:
		if area == get_node("/root/GUI/trashBin/trashButton/trashArea"):
			Global.seedSelected = 0
			Global.lightLevel = 0
			Global.itTrowel = false
			Global.mouseClick = false
			get_node("/root/GUI/trashBin").hide()
			self.queue_free()
