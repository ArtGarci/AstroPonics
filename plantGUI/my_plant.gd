extends Node2D

@onready var spriteAnim = $plantGrowing
var plantGrowing = false

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
	if Global.itTrowel == true:
		if plantGrowing == true:
			plantGrowing = false
			spriteAnim.animation = "none"
			Global.seedSelected = 0

# used for testing
func setGlobalVariables(itSeed, lightLevel, seedSelected):
	if itSeed == true:
		Global.itSeed = itSeed
	if itSeed == false:
		Global.itTrowel = true
	Global.lightLevel = lightLevel
	Global.seedSelected = seedSelected
	
func isPlantGrowing():
	return plantGrowing

func setPlantGrowing(isGrowing):
	plantGrowing = isGrowing
