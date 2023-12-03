extends Node2D



#go to next page
func next():
	get_tree().change_scene_to_file("res://Tutorials/tutorial_page_4.tscn")

#go to previous page
func prev():
	get_tree().change_scene_to_file("res://Tutorials/tutorial_page_2.tscn")

#go to main menu
func mainmenu():
	get_tree().change_scene_to_file("res://main_menu_display.tscn")

#go straight to game
func Skip():
	get_tree().change_scene_to_file("res://scenes/game.tscn")
