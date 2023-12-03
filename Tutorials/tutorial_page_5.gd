extends Node2D

#go to the game page
func next():
	get_tree().change_scene_to_file("res://game.tscn")

#go to prev page
func prev():
	get_tree().change_scene_to_file("res://Tutorials/tutorial_page_4.tscn")

#go to main menu
func main():
	get_tree().change_scene_to_file("res://main_menu_display.tscn")

#go straight to game
func Skip():
	get_tree().change_scene_to_file("res://game.tscn")
