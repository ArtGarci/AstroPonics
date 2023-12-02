extends Node2D




func next():
	get_tree().change_scene_to_file("res://Tutorials/tutorial_page_4.tscn")


func prev():
	get_tree().change_scene_to_file("res://Tutorials/tutorial_page_2.tscn")


func mainmenu():
	get_tree().change_scene_to_file("res://main_menu_display.tscn")
