extends Node2D



#go to next page
func next():
	get_tree().change_scene_to_file("res://Tutorials/tutorial_page_3.tscn")
#go to previous page
func previous():
	get_tree().change_scene_to_file("res://Tutorials/tutorial_page_1.tscn")

#go to main menu
func mainmenu():
	get_tree().change_scene_to_file("res://main_menu_display.tscn")

#go straight to the main game
func Skip():
	get_tree().change_scene_to_file("res://game.tscn")
