extends Node2D

@onready var spriteAnim = $plantGrowing
var plantGrowing = false

func _on_plant_button_pressed():
	if Global.itTrowel == true:
		if plantGrowing == true:
			plantGrowing = false
			spriteAnim.animation = "none"
			Global.seedSelected = 0

# 1=lettace 2=radish 3=chives 4=potatoes 5=wheat 6=tomatoes
# when the seed goes over a grow plot, the plant animation starts
func _on_plant_collision_area_entered(area):
	if Global.itSeed == true:
		if area.name == "seedArea":
			if Global.lightLevel == 2:
				if Global.seedSelected == 0:
					spriteAnim.play("none")
					plantGrowing = false
				if Global.seedSelected == 4 and plantGrowing == false:
					spriteAnim.play("growPotatoes")	
					plantGrowing = true
				if Global.seedSelected == 5 and plantGrowing == false:
					spriteAnim.play("growWheats")
					plantGrowing = true
				if Global.seedSelected == 6 and plantGrowing == false:
					spriteAnim.play("growTomatoes")
					plantGrowing = true
	#if Global.itTrowel == true:
	#	if plantGrowing == true:
	#			plantGrowing = false
	#			spriteAnim.animation = "none"
	#			Global.seedSelected = 0
	#			mouseClick = false

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

