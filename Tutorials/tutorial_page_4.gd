extends Node2D



#next page
func _on_texture_button_pressed():
	get_tree().change_scene_to_file("res://Tutorials/tutorial_page_5.tscn")

#prev page

func _on_texture_button_2_pressed():
	get_tree().change_scene_to_file("res://Tutorials/tutorial_page_3.tscn")
	
#main menu



func _on_button_2_pressed():
	get_tree().change_scene_to_file("res://main_menu_display.tscn")


func Skip():
	get_tree().change_scene_to_file("res://game.tscn")
