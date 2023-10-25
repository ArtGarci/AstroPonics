extends GutTest

var SPAWNSEED = preload("res://scenes/drag_seed.tscn")
var TRASH = preload("res://scenes/trash_bin.tscn")

func test_drag_seed():
	var testSeed = SPAWNSEED.instantiate()
	add_child_autofree(testSeed)
	assert_true(testSeed.isVisbale(), "Passed if seed is visable")
	
func test_trash_area():
	var testSeed = SPAWNSEED.instantiate()
	var trashArea = TRASH.instantiate()
	add_child_autofree(trashArea)
	add_child_autofree(testSeed)
	testSeed._on_area_2d_area_entered(trashArea)
	assert_eq(testSeed.whatIsSeed(), 0)
	assert_eq(testSeed.lightLevel(), 0)
	assert_false(testSeed.isItSeed(), "Passed if seed was removed")
