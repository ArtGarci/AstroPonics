extends Node2D

@onready var spriteAnim = $plantGrowing
var plantGrowing = false

func _on_plant_button_pressed():
	if Global.itTrowel == true:				# checks that trowel is picked
		if plantGrowing == true:			# checks that a plant is growing
			plantGrowing = false			# sets plant growing to false
			spriteAnim.animation = "none"	# removes animation
			Global.seedSelected = 0			# sets Global Variable seed selections to 0

# 1=lettace 2=radish 3=chives 4=potatoes 5=wheat 6=tomatoes
# when the seed goes over a grow plot, the plant animation starts
func _on_plant_collision_area_entered(area):
	if Global.itSeed == true:					# checks that seed is selected
		if area.name == "seedArea":				# makes sure the sead is over pot area
			if Global.lightLevel == 2:			# checks that seed light level is high	
				if Global.seedSelected == 0:	# default sets animation to none and plant false
					spriteAnim.play("none")
					plantGrowing = false
				# grows plant depending on global variable seedSelected and plant is not growing
				if Global.seedSelected == 4 and plantGrowing == false:	
					spriteAnim.play("growPotatoes")	
					plantGrowing = true
				if Global.seedSelected == 5 and plantGrowing == false:
					spriteAnim.play("growWheats")
					plantGrowing = true
				if Global.seedSelected == 6 and plantGrowing == false:
					spriteAnim.play("growTomatoes")
					plantGrowing = true

# used for testing
func setGlobalVariables(itSeed, lightLevel, seedSelected, isTrowel=false):
	Global.itSeed = itSeed
	Global.itTrowel = isTrowel
	Global.lightLevel = lightLevel
	Global.seedSelected = seedSelected
	
func isPlantGrowing():
	return plantGrowing

func setPlantGrowing(isGrowing):
	plantGrowing = isGrowing

