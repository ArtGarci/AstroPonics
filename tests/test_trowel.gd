extends GutTest

var SPAWNTROWEL = preload("res://scenes/trowel.tscn")
var TRASH = preload("res://scenes/trash_bin.tscn")

func test_trowel_drag():
	var testTrowel = SPAWNTROWEL.instantiate()
	add_child_autofree(testTrowel)
	assert_true(testTrowel.isVisbale(), "Passed if trowel is visable")
	
func test_trash_area():
	var testTrowel = SPAWNTROWEL.instantiate()
	var trashArea = TRASH.instantiate()
	add_child_autofree(trashArea)
	add_child_autofree(testTrowel)
	trashArea = trashArea.get_child(0)
	trashArea = trashArea.get_child(0)
	testTrowel._on_trowel_area_area_entered(trashArea)
	assert_eq(testTrowel.whatIsSeed(), 0)
	assert_eq(testTrowel.lightLevel(), 0)
	assert_false(testTrowel.isItTrowel(), "Passed if trowel was removed")
	
