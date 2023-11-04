#Ace Aceron
extends Node2D


#next button will be scripted later on

#prev button will go back to second page


func _on_button_2_pressed():
	get_tree().change_scene_to_file("res://Tutorials/tutorial_page_2.tscn")
