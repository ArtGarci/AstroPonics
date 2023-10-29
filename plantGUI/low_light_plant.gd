extends Node2D

@onready var spriteAnim = $lowPlant
var plantGrowing = false

	
# 1=lettace 2=radish 3=chives 4=potatoes 5=wheat 6=tomatoes
# when the seed goes over a grow plot, the plant animation starts
func _on_low_plant_coll_area_entered(area):
	if Global.itSeed == true:
		if area.name == "seedArea":
			if Global.lightLevel == 1:
				if Global.seedSelected == 0:
					spriteAnim.play("none")
					plantGrowing = false
				if Global.seedSelected == 1 and plantGrowing == false:
					spriteAnim.play("lettaceGrow")
					plantGrowing = true
				if Global.seedSelected == 2 and plantGrowing == false:
					spriteAnim.play("radishGrow")
					plantGrowing = true
				if Global.seedSelected == 3 and plantGrowing == false:
					spriteAnim.play("chivesGrow")
					plantGrowing = true
	if Global.itTrowel == true:
		if plantGrowing == true:
			plantGrowing = false
			spriteAnim.animation = "none"
			Global.seedSelected = 0

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
