extends GutTest

var SPAWN = preload("res://scenes/credits.tscn")
var MAINMENU = preload("res://main_menu_display.tscn")

func test_on_pressed():
	var testButton = SPAWN.instantiate()
	var testScene = testButton.get_node("Timer/start game")
	add_child(testButton)
	testScene.pressed.emit()
	assert_ne(testScene, SPAWN)
