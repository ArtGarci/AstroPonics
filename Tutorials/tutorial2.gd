#Ace Aceron
extends Node2D




#next button will change scene to page 3 of tutorial
func _on_next_pressed():
	get_tree().change_scene_to_file("res://Tutorials/tutorial_page_3.tscn")

#prev button will change scene to page 1
func _on_prev_pressed():
	get_tree().change_scene_to_file("res://Tutorials/tutorial_page_1.tscn")

#the exit button will go back to the main menu
func _on_button_3_pressed():
	get_tree().change_scene_to_file("res://main_menu_display.tscn")
