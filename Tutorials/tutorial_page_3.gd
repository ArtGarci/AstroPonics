extends Node2D



#this will go to the next page
func _on_texture_button_pressed():
	get_tree().change_scene_to_file("res://Tutorials/tutorial_page_4.tscn")
	

#this will go to prev page
func _on_texture_button_2_pressed():
	get_tree().change_scene_to_file("res://Tutorials/tutorial_page_2.tscn")
	

#this will go to main menu
func _on_button_2_pressed():
	get_tree().change_scene_to_file("res://main_menu_display.tscn")
