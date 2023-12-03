extends Node2D


func _on_water_micro_game_pressed():
	Global.SAVE.emit()
	get_tree().change_scene_to_file('res://MicroGames/MicroGameScenes/water_instructions.tscn')

func _on_p_h_micro_game_pressed():
	Global.MICRO.emit()
	Global.SAVE.emit()
	get_tree().change_scene_to_file('res://MicroGames/MicroGameScenes/pH_instructions.tscn')

func _on_trim_micro_game_pressed():
	Global.SAVE.emit()
	get_tree().change_scene_to_file('res://MicroGames/MicroGameScenes/trim_instructions.tscn')
