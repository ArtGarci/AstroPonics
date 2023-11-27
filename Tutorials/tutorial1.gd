#Ace Aceron
extends Node2D





#the exit button will go back to the main menu
func _on_button_2_pressed():
	get_tree().change_scene_to_file("res://main_menu_display.tscn")

#Next button pressed will go to second page
func _on_texture_button_pressed():
	get_tree().change_scene_to_file("res://Tutorials/tutorial_page_2.tscn")
