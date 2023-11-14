extends Button

func _on_pressed():
	get_tree().change_scene_to_file("res://game.tscn")
	
func _on_ref_guide_pressed():
	get_tree().change_scene_to_file("res://Objects/reference_menu.tscn")

func _on_credits_info_pressed():
	get_tree().change_scene_to_file("res://credits.tscn")

func _on_exit_game_pressed():
	get_tree().quit()
