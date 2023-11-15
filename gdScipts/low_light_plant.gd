extends Node2D

@onready var spriteAnim = $lowPlant
var plantGrowing = false
var weeksAlive = 0
var isHarvestable = false
var score = 100

func _ready():
	Global.connect("nextWeekSignal", Callable(self, "weekSignal"))

func weekSignal():
	weeksAlive += 1
	if $Anima.assigned_animation == "lettaceAnim0":
		if weeksAlive == 4:
			$Anima.play("lettaceAnim1")
	if $Anima.assigned_animation == "lettaceAnim1": 
		if weeksAlive == 8:
			$Anima.play("lettaceAnim2")
			isHarvestable = true
	if $Anima.assigned_animation == "radishAnim0":
		if weeksAlive == 2:
			$Anima.play("radishAnim1")
	if $Anima.assigned_animation == "radishAnim1":
		if weeksAlive == 4:
			$Anima.play("radishAnim2")
			isHarvestable = true
	if $Anima.assigned_animation == "chivesAnim0":
		if weeksAlive == 2:
			$Anima.play("chivesAnim1")
	if $Anima.assigned_animation == "chivesAnim1": 
		if weeksAlive == 4:
			$Anima.play("chivesAnim2")
			isHarvestable = true

func _on_low_light_but_pressed():
	if Global.itTrowel == true:				# checks that trowel is picked
		if plantGrowing == true:			# checks that a plant is growing
			plantGrowing = false			# sets plant growing to false
			$Anima.clear_queue()						# removes animation
			$Anima.play("none")
			Global.seedSelected = 0			# sets Global Variable seed selections to 0
			weeksAlive = 0
	if isHarvestable == true:
		plantGrowing = false			# sets plant growing to false
		$Anima.clear_queue()						# removes animation
		$Anima.play("none")
		Global.seedSelected = 0			# sets Global Variable seed selections to 0
		weeksAlive = 0
		isHarvestable = false
		return score

# 1=lettace 2=radish 3=chives 4=potatoes 5=wheat 6=tomatoes
# when the seed goes over a grow plot, the plant animation starts
func _on_low_plant_coll_area_entered(area):
	if Global.itSeed == true:					# checks that seed is selected
		if area.name == "seedArea":				# makes sure the sead is over pot area
			if Global.lightLevel == 1:			# checks that seed light level is low
				if Global.seedSelected == 0:
					$Anima.play("none")
					plantGrowing = false
				# grows plant depending on global variable seedSelected and plant is not growing
				if Global.seedSelected == 1 and plantGrowing == false:
					$Anima.play("lettaceAnim0")
					plantGrowing = true
				if Global.seedSelected == 2 and plantGrowing == false:
					$Anima.play("radishAnim0")
					plantGrowing = true
				if Global.seedSelected == 3 and plantGrowing == false:
					$Anima.play("chivesAnim0")
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
