extends GutTest

var GUIPREVIEW = preload("res://scenes/guiPlants.tscn")

func test_on_button_for_menu_pressed():
	var guiPreview = GUIPREVIEW.instantiate()
	add_child_autofree(guiPreview)
	assert_false(guiPreview.isMenuVisable(), "Pass if menu is not visible")
	guiPreview._on_button_for_menu_pressed()
	assert_true(guiPreview.isMenuVisable(), "Pass if menu is visible")
	
func test_on_exit_button_pressed():
	var guiPreview = GUIPREVIEW.instantiate()
	add_child_autofree(guiPreview)
	guiPreview._on_button_for_menu_pressed()
	assert_true(guiPreview.isMenuVisable(), "Pass if menu is visible")
	guiPreview._on_exit_button_pressed()
	assert_false(guiPreview.isMenuVisable(), "Pass if menu is not visible")
	
func test_on_lettace_seed_gui_input():
	var testEvent = InputEventMouseButton.new()
	var guiPreview = GUIPREVIEW.instantiate()
	add_child_autofree(guiPreview)
	guiPreview._on_lettace_seed_gui_input(testEvent)
	assert_eq(guiPreview.whatIsSeed(), 1)
	assert_eq(guiPreview.whatIsLightLevel(), 1)
	assert_true(guiPreview.isItSeed(), "Passes if Global.itSeed is true")
	assert_false(guiPreview.isMenuVisable(), "Passes if menu is hidden")
	
func test_on_radish_seed_gui_input():
	var testEvent = InputEventMouseButton.new()
	var guiPreview = GUIPREVIEW.instantiate()
	add_child_autofree(guiPreview)
	guiPreview._on_radish_seed_gui_input(testEvent)
	assert_eq(guiPreview.whatIsSeed(), 2)
	assert_eq(guiPreview.whatIsLightLevel(), 1)
	assert_true(guiPreview.isItSeed(), "Passes if Global.itSeed is true")
	assert_false(guiPreview.isMenuVisable(), "Passes if menu is hidden")

func test_on_chives_seed_gui_input():
	var testEvent = InputEventMouseButton.new()
	var guiPreview = GUIPREVIEW.instantiate()
	add_child_autofree(guiPreview)
	guiPreview._on_chives_seed_gui_input(testEvent)
	assert_eq(guiPreview.whatIsSeed(), 3)
	assert_eq(guiPreview.whatIsLightLevel(), 1)
	assert_true(guiPreview.isItSeed(), "Passes if Global.itSeed is true")
	assert_false(guiPreview.isMenuVisable(), "Passes if menu is hidden")
	
func test_on_potatoes_seed_gui_input():
	var testEvent = InputEventMouseButton.new()
	var guiPreview = GUIPREVIEW.instantiate()
	add_child_autofree(guiPreview)
	guiPreview._on_potatoes_seed_gui_input(testEvent)
	assert_eq(guiPreview.whatIsSeed(), 4)
	assert_eq(guiPreview.whatIsLightLevel(), 2)
	assert_true(guiPreview.isItSeed(), "Passes if Global.itSeed is true")
	assert_false(guiPreview.isMenuVisable(), "Passes if menu is hidden")
	
func test_on_wheat_seed_gui_input():
	var testEvent = InputEventMouseButton.new()
	var guiPreview = GUIPREVIEW.instantiate()
	add_child_autofree(guiPreview)
	guiPreview._on_wheat_seed_gui_input(testEvent)
	assert_eq(guiPreview.whatIsSeed(), 5)
	assert_eq(guiPreview.whatIsLightLevel(), 2)
	assert_true(guiPreview.isItSeed(), "Passes if Global.itSeed is true")
	assert_false(guiPreview.isMenuVisable(), "Passes if menu is hidden")

func test_on_tomatoes_seeds_gui_input():
	var testEvent = InputEventMouseButton.new()
	var guiPreview = GUIPREVIEW.instantiate()
	add_child_autofree(guiPreview)
	guiPreview._on_tomatoes_seeds_gui_input(testEvent)
	assert_eq(guiPreview.whatIsSeed(), 6)
	assert_eq(guiPreview.whatIsLightLevel(), 2)
	assert_true(guiPreview.isItSeed(), "Passes if Global.itSeed is true")
	assert_false(guiPreview.isMenuVisable(), "Passes if menu is hidden")

func test_on_texture_button_gui_input():
	var testEvent = InputEventMouseButton.new()
	var guiPreview = GUIPREVIEW.instantiate()
	add_child_autofree(guiPreview)
	guiPreview._on_texture_button_gui_input(testEvent)
	assert_true(guiPreview.isItTrowel(), "Passes if Global.isTrowel is true")
	assert_false(guiPreview.isMenuVisable(), "Passes if menu is hidden")
