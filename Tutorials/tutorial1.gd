#Ace Aceron
extends Node2D



#Next button pressed will go to second page
func _on_next_pressed():
	get_tree().change_scene_to_file("res://Tutorials/tutorial_page_2.tscn")

#the exit button will go back to the main menu
func _on_button_2_pressed():
	get_tree().change_scene_to_file("res://main_menu_display.tscn")
