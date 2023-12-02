extends Node2D

@onready var spriteAnim = $lowPlant
var plantGrowing = false
var weeksAlive = 0
var isHarvestable = false
var currPH = 0.0

func _ready():
	Global.connect("nextWeekSignal", Callable(self, "weekSignal"))
	#signal from random effect that changes ph here
	Global.connect("PHEFFECT", Callable(self, "phChange"))
	#signal from mini game that fixes ph here
	Global.connect("MICRO", Callable(self, "fixPH"))

func phChange(reBool=false):
	# random number generated and if 0 or 1 then PH is changed (20% chance)
	if (randi() % 10) < 2 or (reBool == true and plantGrowing == true):
		# random generated and if 0 then add random number between 1 and 3
		if randi() % 2 == 0:
			currPH = currPH + randf_range(1,3)	# adds random number between 1 and 3
			currPH = snapped(currPH, .01)		# round to the nearest tenth(.01)
		# if random number not 0 then subtract number between 1 and 3
		else:
			currPH = currPH - randf_range(1,3)	# subtracts random number between 1 and 3
			currPH = snapped(currPH, .01)		# round to the nearest tenth(.01)
		
func fixPH():
	if $Anima.assigned_animation == "lettaceAnim0" or $Anima.assigned_animation == "lettaceAnim1" or $Anima.assigned_animation == "lettaceAnim2":
		currPH = 6.0
	if $Anima.assigned_animation == "radishAnim0" or $Anima.assigned_animation == "radishAnim1" or $Anima.assigned_animation == "radishAnim2":
		currPH = 6.5
	if $Anima.assigned_animation == "chivesAnim0" or $Anima.assigned_animation == "chivesAnim1" or $Anima.assigned_animation == "chivesAnim2":
		currPH = 6.0

func weekSignal():
	if plantGrowing == true:
		phChange()
	weeksAlive += 1
	
	if $Anima.assigned_animation == "lettaceAnim0":
		# at 4 weeks lettace animation will change
		if weeksAlive == 4:
			$Anima.play("lettaceAnim1")
	if $Anima.assigned_animation == "lettaceAnim1": 
		# at 8 weeks lettace animation will change and plant is harvestable
		if weeksAlive == 8:
			$Anima.play("lettaceAnim2")
			isHarvestable = true
	if $Anima.assigned_animation == "radishAnim0":
		# at 2 weeks radish animation will change
		if weeksAlive == 2:
			$Anima.play("radishAnim1")
	if $Anima.assigned_animation == "radishAnim1":
		# at 4 weeks radish animation will change and plant is harvestable
		if weeksAlive == 4:
			$Anima.play("radishAnim2")
			isHarvestable = true
	if $Anima.assigned_animation == "chivesAnim0":
		# at 2 weeks chives animation will change
		if weeksAlive == 2:
			$Anima.play("chivesAnim1")
	if $Anima.assigned_animation == "chivesAnim1": 
		# at 4 weeks chives animation will change and plant is harvestable
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
		var message = ""
		# harvest points:lettace-> 15 points,Radish-> 12 points, chives-> 10 points
		if $Anima.assigned_animation == "lettaceAnim2":
			message = "Lettace Harvested"
			GlobalScoreLabel.set_score(message, 15)		# points added to score and message put in log
		if $Anima.assigned_animation == "radishAnim2":
			message = "Radish Harvested"
			GlobalScoreLabel.set_score(message, 12)		# points added to score and message put in log
		if $Anima.assigned_animation == "chivesAnim2":
			message = "Chives Harvested"
			GlobalScoreLabel.set_score(message, 10)		# points added to score and message put in log
		plantGrowing = false			# sets plant growing to false
		$Anima.clear_queue()			# removes animation
		$Anima.play("none")
		Global.seedSelected = 0			# sets Global Variable seed selections to 0
		weeksAlive = 0					# resset weeks alive
		isHarvestable = false			# set havestable to false
		currPH = 0.0

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
					currPH = 6.0
					plantGrowing = true
				if Global.seedSelected == 2 and plantGrowing == false:
					$Anima.play("radishAnim0")
					currPH = 6.5
					plantGrowing = true
				if Global.seedSelected == 3 and plantGrowing == false:
					$Anima.play("chivesAnim0")
					currPH = 6.0
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
	
func returnAnima():
	return $Anima.assigned_animation
