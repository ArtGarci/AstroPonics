extends AnimatedSprite2D

# Called every frame. 'delta' is the elapsed time since the previous frame.
# add left click action to protect settings for this to work
func _process(delta):
	global_position = get_global_mouse_position()
	
	
	if Input.is_action_just_pressed("click"):
		self.show()
		
#when the seed enters the bin area it hides sets global variables to zero,
#and hides the seed then queue frees the seed to get rid of the instance
func _on_area_2d_area_entered(area):
	if area == get_node("/root/GUI/trashBin/trashButton/trashArea"):
		Global.seedSelected = 0
		Global.lightLevel = 0
		Global.itSeed = false
		Global.mouseClick = false
		get_node("/root/GUI/trashBin").hide()
		self.queue_free()


