extends Node2D




func next():
	get_tree().change_scene_to_file("res://Tutorials/tutorial_page_3.tscn")

func previous():
	get_tree().change_scene_to_file("res://Tutorials/tutorial_page_1.tscn")


func mainmenu():
	get_tree().change_scene_to_file("res://main_menu_display.tscn")
