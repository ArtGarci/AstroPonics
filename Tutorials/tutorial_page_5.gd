extends Node2D




#go to the game
func _on_texture_button_pressed():
	get_tree().change_scene_to_file("res://scenes/game.tscn")
	


#go to prev page
func _on_texture_button_2_pressed():
	get_tree().change_scene_to_file("res://Tutorials/tutorial_page_4.tscn")



#go to main menu
func _on_button_2_pressed():
	get_tree().change_scene_to_file("res://main_menu_display.tscn")
