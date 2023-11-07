extends Node2D

@onready var spriteAnim = $lowPlant
var plantGrowing = false

func _on_low_light_but_pressed():
	if Global.itTrowel == true:				# checks that trowel is picked
		if plantGrowing == true:			# checks that a plant is growing
			plantGrowing = false			# sets plant growing to false
			spriteAnim.animation = "none"	# removes animation
			Global.seedSelected = 0			# sets Global Variable seed selections to 0

# 1=lettace 2=radish 3=chives 4=potatoes 5=wheat 6=tomatoes
# when the seed goes over a grow plot, the plant animation starts
func _on_low_plant_coll_area_entered(area):
	if Global.itSeed == true:					# checks that seed is selected
		if area.name == "seedArea":				# makes sure the sead is over pot area
			if Global.lightLevel == 1:			# checks that seed light level is low
				if Global.seedSelected == 0:
					spriteAnim.play("none")
					plantGrowing = false
				# grows plant depending on global variable seedSelected and plant is not growing
				if Global.seedSelected == 1 and plantGrowing == false:
					spriteAnim.play("lettaceGrow")
					plantGrowing = true
				if Global.seedSelected == 2 and plantGrowing == false:
					spriteAnim.play("radishGrow")
					plantGrowing = true
				if Global.seedSelected == 3 and plantGrowing == false:
					spriteAnim.play("chivesGrow")
					plantGrowing = true

# used for testing
func setGlobalVariables(itSeed, lightLevel, seedSelected, itTrowel=false):
	Global.itSeed = itSeed
	Global.lightLevel = lightLevel
	Global.seedSelected = seedSelected
	Global.itTrowel = itTrowel
	
func isPlantGrowing():
	return plantGrowing

func setPlantGrowing(isGrowing):
	plantGrowing = isGrowing
