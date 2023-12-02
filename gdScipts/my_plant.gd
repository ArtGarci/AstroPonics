extends Node2D

@onready var spriteAnim = $plantGrowing
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
	if $Anima.assigned_animation == "potateAnim0" or $Anima.assigned_animation == "potateAnim1" or $Anima.assigned_animation == "potateAnim2":
		currPH = 6.0
	if $Anima.assigned_animation == "wheatAnim0" or $Anima.assigned_animation == "wheatAnim1" or $Anima.assigned_animation == "wheatAnim2":
		currPH = 6.5
	if $Anima.assigned_animation == "tomatoeAnim0" or $Anima.assigned_animation == "tomatoeAnim1" or $Anima.assigned_animation == "tomatoeAnim2":
		currPH = 6.2

func weekSignal():
	if plantGrowing == true:
		phChange()
	weeksAlive += 1		# increment the amount of weeks alive
	
	if $Anima.assigned_animation == "potateAnim0":
		# at 8 weeks potatoe animation will change
		if weeksAlive == 8:
			$Anima.play("potateAnim1")
	if $Anima.assigned_animation == "potateAnim1": 
		# at 12 weeks potatoe animation will change and plant is harvestable
		if weeksAlive == 12:
			$Anima.play("potateAnim2")
			isHarvestable = true
	if $Anima.assigned_animation == "wheatAnim0":
		# at 4 weeks wheat animation will change
		if weeksAlive == 4:
			$Anima.play("wheatAnim1")
	if $Anima.assigned_animation == "wheatAnim1":
		# at 8 weeks wheat animation will change and plant is harvestable
		if weeksAlive == 8:
			$Anima.play("wheatAnim2")
			isHarvestable = true
	if $Anima.assigned_animation == "tomatoeAnim0":
		# at 8 weeks tomatoe animation will change
		if weeksAlive == 8:
			$Anima.play("tomatoeAnim1")
	if $Anima.assigned_animation == "tomatoeAnim1": 
		# at 12 weeks tomatoe animation will change and plant is harvestable
		if weeksAlive == 12:
			$Anima.play("tomatoeAnim2")
			isHarvestable = true

func _on_plant_button_pressed():
	if Global.itTrowel == true:				# checks that trowel is picked
		if plantGrowing == true:			# checks that a plant is growing
			plantGrowing = false			# sets plant growing to false
			$Anima.clear_queue()			# removes animation
			$Anima.play("none")
			Global.seedSelected = 0			# sets Global Variable seed selections to 0
			weeksAlive = 0
	if isHarvestable == true:
		var message = ""
		# harvest points:potatoe-> 20 points,wheat-> 18 points, tomatoes-> 25 points
		if $Anima.assigned_animation == "potateAnim2":
			message = "Potatoe Harvested"
			GlobalScoreLabel.set_score(message, 20)		# points added to score and message put in log
		if $Anima.assigned_animation == "wheatAnim2":
			message = "Wheat Harvested"
			GlobalScoreLabel.set_score(message, 18)		# points added to score and message put in log
		if $Anima.assigned_animation == "tomatoeAnim2":
			message = "Tomatoes Harvested"
			GlobalScoreLabel.set_score(message, 25)		# points added to score and message put in log
		plantGrowing = false			# sets plant growing to false
		$Anima.clear_queue()			# removes animation
		$Anima.play("none")
		Global.seedSelected = 0			# sets Global Variable seed selections to 0
		weeksAlive = 0					# set weeks alive to zero
		isHarvestable = false			# set to not harvestable
		currPH = 0.0

# 1=lettace 2=radish 3=chives 4=potatoes 5=wheat 6=tomatoes
# when the seed goes over a grow plot, the plant animation starts
func _on_plant_collision_area_entered(area):
	if Global.itSeed == true:					# checks that seed is selected
		if area.name == "seedArea":				# makes sure the sead is over pot area
			if Global.lightLevel == 2:			# checks that seed light level is high	
				if Global.seedSelected == 0:	# default sets animation to none and plant false
					$Anima.play("none")
					plantGrowing = false
				# grows plant depending on global variable seedSelected and plant is not growing
				if Global.seedSelected == 4 and plantGrowing == false:	
					$Anima.play("potateAnim0")	# set animation for potatoes
					currPH = 6.0				# set ph level
					plantGrowing = true
				if Global.seedSelected == 5 and plantGrowing == false:
					$Anima.play("wheatAnim0")	# set animation for wheat
					currPH = 6.5				# set ph level
					plantGrowing = true
				if Global.seedSelected == 6 and plantGrowing == false:
					$Anima.play("tomatoeAnim0")	# set animation for tomatoes
					currPH = 6.2				# set ph level
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
	
func returnAnima():
	return $Anima.assigned_animation

