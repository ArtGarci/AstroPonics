extends Node2D


func next():
	get_tree().change_scene_to_file("res://game.tscn")


func prev():
	get_tree().change_scene_to_file("res://Tutorials/tutorial_page_4.tscn")


func main():
	get_tree().change_scene_to_file("res://main_menu_display.tscn")
