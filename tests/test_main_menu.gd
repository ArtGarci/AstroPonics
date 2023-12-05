extends GutTest

var MAINMENU = preload("res://menu.tscn")
var CREDITS = preload("res://scenes/credits.tscn")
var TUTORIAL = preload("res://Tutorials/tutorial_page_1.tscn")

func test_on_pressed(): #tutorial page
	var testButton = MAINMENU.instantiate()
	var testScene = testButton.get_node("MarginContainer/VBoxContainer/start game")
	add_child(testButton)
	testScene.pressed.emit()
	assert_ne(testScene, MAINMENU)

func test_on_ref_guide_pressed(): #ref guide
	var testButton = MAINMENU.instantiate()
	var testScene = testButton.get_node("MarginContainer/VBoxContainer/ref guide")
	add_child(testButton)
	testScene.pressed.emit()
	assert_ne(testScene, MAINMENU)

func test_on_credits_info_pressed(): #credits
	var testButton = MAINMENU.instantiate()
	var testScene = testButton.get_node("MarginContainer/VBoxContainer/credits_info")
	add_child(testButton)
	testScene.pressed.emit()
	assert_ne(testScene, MAINMENU)

func test_on_exit_game_pressed(): #exit
	var testButton = MAINMENU.instantiate()
	var testScene = testButton.get_node("MarginContainer/VBoxContainer/exit_game")
	add_child(testButton)
	testScene.pressed.emit()
	assert_ne(testScene, MAINMENU)
