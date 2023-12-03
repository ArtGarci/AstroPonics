extends Node2D



#go back to main menu
func Exitbutton():
	get_tree().change_scene_to_file("res://main_menu_display.tscn")
	


#go to the next page
func nextpage():
	get_tree().change_scene_to_file("res://Tutorials/tutorial_page_2.tscn")

#go straight to the game
func Skip():
	get_tree().change_scene_to_file("res://scenes/game.tscn")
