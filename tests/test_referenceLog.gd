extends GutTest

class TestButtons:
	extends GutTest
	var RefScenePath = load("res://Objects/reference_menu.tscn")
	var referenceTextContainer = null
	var RefScene = null
	
	func before_each():
		RefScene = RefScenePath.instantiate()
		add_child(RefScene)
		referenceTextContainer = RefScene.get_node("Background/VBoxContainer/ReferenceGuideText")
		InputMap.add_action("click")
		
	func test_initialState():
		assert_eq(referenceTextContainer.text, "This guide provides all the information you'll need to be a successful space farmer!")

	func test_lettuceBtn():
		var lettuceBtn = RefScene.get_node("Background/ScrollContainer/PlantVBoxContainer/LettuceHBoxContainer/LettuceBtn")
		lettuceBtn.pressed.emit()
		assert_ne(referenceTextContainer.text, "This guide provides all the information you'll need to be a successful space farmer!")

	func test_radishBtn():
		var radishBtn = RefScene.get_node("Background/ScrollContainer/PlantVBoxContainer/RadishHBoxContainer/RadishBtn")
		radishBtn.pressed.emit()
		assert_ne(referenceTextContainer.text, "This guide provides all the information you'll need to be a successful space farmer!")
		
	func test_chivesBtn():
		var chivesBtn = RefScene.get_node("Background/ScrollContainer/PlantVBoxContainer/ChivesHBoxContainer/ChivesBtn")
		chivesBtn.pressed.emit()
		assert_ne(referenceTextContainer.text, "This guide provides all the information you'll need to be a successful space farmer!")

	func test_potatoBtn():
		var potatoBtn = RefScene.get_node("Background/ScrollContainer/PlantVBoxContainer/PotatoHBoxContainer/PotatoBtn")
		potatoBtn.pressed.emit()
		assert_ne(referenceTextContainer.text, "This guide provides all the information you'll need to be a successful space farmer!")
		
	func test_tomatoBtn():
		var tomatoBtn = RefScene.get_node("Background/ScrollContainer/PlantVBoxContainer/TomatoHBoxContainer/TomatoBtn")
		tomatoBtn.pressed.emit()
		assert_ne(referenceTextContainer.text, "This guide provides all the information you'll need to be a successful space farmer!")
		
	func test_wheatBtn():
		var wheatBtn = RefScene.get_node("Background/ScrollContainer/PlantVBoxContainer/WheatHBoxContainer/WheatBtn")
		wheatBtn.pressed.emit()
		assert_ne(referenceTextContainer.text, "This guide provides all the information you'll need to be a successful space farmer!")
