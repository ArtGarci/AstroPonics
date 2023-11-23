extends GutTest

var MYPLANTS = preload("res://scenes/my_plant.tscn")
var MYPLANTLOW = preload("res://scenes/low_light_plant.tscn")
var SPAWNSEED = preload("res://scenes/drag_seed.tscn")

# wheat harvestable at 8 weeks, potatoe and tomatoe harvestable at 12 weeks
func test_myPlant_high():
	var thisArea = SPAWNSEED.instantiate()
	var potatoePlant = MYPLANTS.instantiate()
	var wheatPlant = MYPLANTS.instantiate()
	var tomatoePlant = MYPLANTS.instantiate()
	add_child_autofree(thisArea)
	add_child_autofree(potatoePlant)
	add_child_autofree(wheatPlant)
	add_child_autofree(tomatoePlant)
	thisArea = thisArea.get_child(0)
	potatoePlant.setGlobalVariables(true, 2, 4)
	potatoePlant._on_plant_collision_area_entered(thisArea)
	# test potate animations and make sure it is harvestable at the end
	assert_eq(potatoePlant.returnAnima(), "potateAnim0")
	potatoePlant.weeksAlive = 7
	potatoePlant.weekSignal()
	assert_eq(potatoePlant.returnAnima(), "potateAnim1")
	potatoePlant.weeksAlive = 11
	potatoePlant.weekSignal()
	assert_eq(potatoePlant.returnAnima(), "potateAnim2")
	assert_true(potatoePlant.isHarvestable)
	# test wheat animations and make sure it is harvestable at the end
	wheatPlant.setGlobalVariables(true, 2, 5)
	wheatPlant._on_plant_collision_area_entered(thisArea)
	assert_eq(wheatPlant.returnAnima(), "wheatAnim0")
	wheatPlant.weeksAlive = 3
	wheatPlant.weekSignal()
	assert_eq(wheatPlant.returnAnima(), "wheatAnim1")
	wheatPlant.weeksAlive = 7
	wheatPlant.weekSignal()
	assert_eq(wheatPlant.returnAnima(), "wheatAnim2")
	assert_true(wheatPlant.isHarvestable)
	# test tomatoe animations and make sure it is harvestable at the end
	tomatoePlant.setGlobalVariables(true, 2, 6)
	tomatoePlant._on_plant_collision_area_entered(thisArea)
	assert_eq(tomatoePlant.returnAnima(), "tomatoeAnim0")
	tomatoePlant.weeksAlive = 7
	tomatoePlant.weekSignal()
	assert_eq(tomatoePlant.returnAnima(), "tomatoeAnim1")
	tomatoePlant.weeksAlive = 11
	tomatoePlant.weekSignal()
	assert_eq(tomatoePlant.returnAnima(), "tomatoeAnim2")
	assert_true(tomatoePlant.isHarvestable)
	
	
# lettace harvestable at 8 weeks, radish and chives harvestable at 4 weeks
func test_myPlant_low():
	var thisArea = SPAWNSEED.instantiate()
	var lettacePlant = MYPLANTLOW.instantiate()
	var radishPlant = MYPLANTLOW.instantiate()
	var chivesPlant = MYPLANTLOW.instantiate()
	add_child_autofree(thisArea)
	add_child_autofree(lettacePlant)
	add_child_autofree(radishPlant)
	add_child_autofree(chivesPlant)
	thisArea = thisArea.get_child(0)
	lettacePlant.setGlobalVariables(true, 1, 1)
	# test lettace animations and make sure it is harvestable at the end
	lettacePlant._on_low_plant_coll_area_entered(thisArea)
	assert_eq(lettacePlant.returnAnima(), "lettaceAnim0")
	lettacePlant.weeksAlive = 3
	lettacePlant.weekSignal()
	assert_eq(lettacePlant.returnAnima(), "lettaceAnim1")
	lettacePlant.weeksAlive = 7
	lettacePlant.weekSignal()
	assert_eq(lettacePlant.returnAnima(), "lettaceAnim2")
	assert_true(lettacePlant.isHarvestable)
	# test radish animations and make sure it is harvestable at the end
	radishPlant.setGlobalVariables(true, 1, 2)
	radishPlant._on_low_plant_coll_area_entered(thisArea)
	assert_eq(radishPlant.returnAnima(), "radishAnim0")
	radishPlant.weeksAlive = 1
	radishPlant.weekSignal()
	assert_eq(radishPlant.returnAnima(), "radishAnim1")
	radishPlant.weeksAlive = 3
	radishPlant.weekSignal()
	assert_eq(radishPlant.returnAnima(), "radishAnim2")
	assert_true(radishPlant.isHarvestable)
	# test chives animation and make sure it is harvestable at the end
	chivesPlant.setGlobalVariables(true, 1, 3)
	chivesPlant._on_low_plant_coll_area_entered(thisArea)
	assert_eq(chivesPlant.returnAnima(), "chivesAnim0")
	chivesPlant.weeksAlive = 1
	chivesPlant.weekSignal()
	assert_eq(chivesPlant.returnAnima(), "chivesAnim1")
	chivesPlant.weeksAlive = 3
	chivesPlant.weekSignal()
	assert_eq(chivesPlant.returnAnima(), "chivesAnim2")
	assert_true(chivesPlant.isHarvestable)

func test_high_trowel():
	var thisArea = SPAWNSEED.instantiate()
	var testPlant = MYPLANTS.instantiate()
	add_child_autofree(thisArea)
	add_child_autofree(testPlant)
	# test trowel function
	testPlant.setGlobalVariables(false, 1, 3, true)
	testPlant.setPlantGrowing(true)
	testPlant._on_plant_button_pressed()
	assert_false(testPlant.isPlantGrowing())
	assert_eq(Global.seedSelected, 0)
	assert_eq(testPlant.returnAnima(), "none")
	# test havest function
	testPlant.setGlobalVariables(false, 0, 3)
	testPlant.isHarvestable = true
	testPlant.setPlantGrowing(true)
	assert_gt(testPlant._on_plant_button_pressed(), 0)
	assert_eq(Global.seedSelected, 0)
	assert_eq(testPlant.returnAnima(), "none")
	assert_false(testPlant.isPlantGrowing())
	assert_false(testPlant.isHarvestable)
	assert_eq(testPlant.weeksAlive, 0)
	
	
func test_low_trowel():
	var thisArea = SPAWNSEED.instantiate()
	var testPlant = MYPLANTLOW.instantiate()
	add_child_autofree(thisArea)
	add_child_autofree(testPlant)
	# test trowel function
	testPlant.setGlobalVariables(false, 2, 4, true)
	testPlant.setPlantGrowing(true)
	testPlant._on_low_light_but_pressed()
	assert_false(testPlant.isPlantGrowing())
	assert_eq(Global.seedSelected, 0)
	assert_eq(testPlant.spriteAnim.animation, "none")
	# test havest function
	testPlant.setGlobalVariables(false, 0, 4, false)
	testPlant.isHarvestable = true
	testPlant.setPlantGrowing(true)
	assert_gt(testPlant._on_low_light_but_pressed(), 0)
	assert_eq(Global.seedSelected, 0)
	assert_eq(testPlant.returnAnima(), "none")
	assert_false(testPlant.isPlantGrowing())
	assert_false(testPlant.isHarvestable)
	assert_eq(testPlant.weeksAlive, 0)
