extends Control


func _ready():
	Global.connect("SAVE", Callable(self, "savePot"))
	Global.connect("LOAD", Callable(self, "loadPot"))

#var plantGrowing = false
#var weeksAlive = 0
#var isHarvestable = false
#var currPH = 0.0
func savePot(): 
	#saving all 5 high light plants
	var nodeToSave = get_node("NinePatchRect/potHolder/highLightPots/potOneH/myPlant")
	var saveAnima = get_node("NinePatchRect/potHolder/highLightPots/potOneH/myPlant/Anima")
	
	Global.potData.potOneH = {
		"plantGrowing" : nodeToSave.plantGrowing,
		"weeksAlive" : nodeToSave.weeksAlive,
		"isHarvestable" : nodeToSave.isHarvestable,
		"currPH" : nodeToSave.currPH,
		"Anima" : saveAnima.assigned_animation
	}
	
	nodeToSave = get_node("NinePatchRect/potHolder/highLightPots/potTwoH/myPlant")
	saveAnima = get_node("NinePatchRect/potHolder/highLightPots/potTwoH/myPlant/Anima")
	Global.potData.potTwoH = {
		"plantGrowing" : nodeToSave.plantGrowing,
		"weeksAlive" : nodeToSave.weeksAlive,
		"isHarvestable" : nodeToSave.isHarvestable,
		"currPH" : nodeToSave.currPH,
		"Anima" : saveAnima.assigned_animation
	}
	nodeToSave = get_node("NinePatchRect/potHolder/highLightPots/potThreeH/myPlant")
	saveAnima = get_node("NinePatchRect/potHolder/highLightPots/potThreeH/myPlant/Anima")
	Global.potData.potThreeH = {
		"plantGrowing" : nodeToSave.plantGrowing,
		"weeksAlive" : nodeToSave.weeksAlive,
		"isHarvestable" : nodeToSave.isHarvestable,
		"currPH" : nodeToSave.currPH,
		"Anima" : saveAnima.assigned_animation
	}
	nodeToSave = get_node("NinePatchRect/potHolder/highLightPots/potFourH/myPlant")
	saveAnima = get_node("NinePatchRect/potHolder/highLightPots/potFourH/myPlant/Anima")
	Global.potData.potFourH = {
		"plantGrowing" : nodeToSave.plantGrowing,
		"weeksAlive" : nodeToSave.weeksAlive,
		"isHarvestable" : nodeToSave.isHarvestable,
		"currPH" : nodeToSave.currPH,
		"Anima" : saveAnima.assigned_animation
	}
	nodeToSave = get_node("NinePatchRect/potHolder/highLightPots/potFiveH/myPlant")
	saveAnima = get_node("NinePatchRect/potHolder/highLightPots/potFiveH/myPlant/Anima")
	Global.potData.potFiveH = {
		"plantGrowing" : nodeToSave.plantGrowing,
		"weeksAlive" : nodeToSave.weeksAlive,
		"isHarvestable" : nodeToSave.isHarvestable,
		"currPH" : nodeToSave.currPH,
		"Anima" : saveAnima.assigned_animation
	}
	nodeToSave = get_node("NinePatchRect/potHolder/lowLightPots/potOneL/lowLightPlant")
	saveAnima = get_node("NinePatchRect/potHolder/lowLightPots/potOneL/lowLightPlant/Anima")
	Global.potData.potOneL = {
		"plantGrowing" : nodeToSave.plantGrowing,
		"weeksAlive" : nodeToSave.weeksAlive,
		"isHarvestable" : nodeToSave.isHarvestable,
		"currPH" : nodeToSave.currPH,
		"Anima" : saveAnima.assigned_animation
	}
	nodeToSave = get_node("NinePatchRect/potHolder/lowLightPots/potTwoL/lowLightPlant")
	saveAnima = get_node("NinePatchRect/potHolder/lowLightPots/potTwoL/lowLightPlant/Anima")
	Global.potData.potTwoL = {
		"plantGrowing" : nodeToSave.plantGrowing,
		"weeksAlive" : nodeToSave.weeksAlive,
		"isHarvestable" : nodeToSave.isHarvestable,
		"currPH" : nodeToSave.currPH,
		"Anima" : saveAnima.assigned_animation
	}
	nodeToSave = get_node("NinePatchRect/potHolder/lowLightPots/potThreeL/lowLightPlant")
	saveAnima = get_node("NinePatchRect/potHolder/lowLightPots/potThreeL/lowLightPlant/Anima")
	Global.potData.potThreeL = {
		"plantGrowing" : nodeToSave.plantGrowing,
		"weeksAlive" : nodeToSave.weeksAlive,
		"isHarvestable" : nodeToSave.isHarvestable,
		"currPH" : nodeToSave.currPH,
		"Anima" : saveAnima.assigned_animation
	}
	nodeToSave = get_node("NinePatchRect/potHolder/lowLightPots/potFourL/lowLightPlant")
	saveAnima = get_node("NinePatchRect/potHolder/lowLightPots/potFourL/lowLightPlant/Anima")
	Global.potData.potFourL = {
		"plantGrowing" : nodeToSave.plantGrowing,
		"weeksAlive" : nodeToSave.weeksAlive,
		"isHarvestable" : nodeToSave.isHarvestable,
		"currPH" : nodeToSave.currPH,
		"Anima" : saveAnima.assigned_animation
	}
	nodeToSave = get_node("NinePatchRect/potHolder/lowLightPots/potFiveL/lowLightPlant")
	saveAnima = get_node("NinePatchRect/potHolder/lowLightPots/potFiveL/lowLightPlant/Anima")
	Global.potData.potFiveL = {
		"plantGrowing" : nodeToSave.plantGrowing,
		"weeksAlive" : nodeToSave.weeksAlive,
		"isHarvestable" : nodeToSave.isHarvestable,
		"currPH" : nodeToSave.currPH,
		"Anima" : saveAnima.assigned_animation
	}

func loadPot():
	var nodeToLoad = get_node("NinePatchRect/potHolder/highLightPots/potOneH/myPlant")
	var animaToLoad = get_node("NinePatchRect/potHolder/highLightPots/potOneH/myPlant/Anima")
	var nodeData = Global.potData["potOneH"]
	# assign variables to first high light plant
	nodeToLoad.plantGrowing = nodeData.plantGrowing
	nodeToLoad.weeksAlive = nodeData.weeksAlive
	nodeToLoad.isHarvestable = nodeData.isHarvestable
	nodeToLoad.currPH = nodeData.currPH
	animaToLoad.play(nodeData.Anima)
	# assign second high light plant
	nodeToLoad = get_node("NinePatchRect/potHolder/highLightPots/potTwoH/myPlant")
	animaToLoad = get_node("NinePatchRect/potHolder/highLightPots/potTwoH/myPlant/Anima")
	nodeData = Global.potData["potTwoH"]
	nodeToLoad.plantGrowing = nodeData.plantGrowing
	nodeToLoad.weeksAlive = nodeData.weeksAlive
	nodeToLoad.isHarvestable = nodeData.isHarvestable
	nodeToLoad.currPH = nodeData.currPH
	animaToLoad.play(nodeData.Anima)
	# assign third high light plant
	nodeToLoad = get_node("NinePatchRect/potHolder/highLightPots/potThreeH/myPlant")
	animaToLoad = get_node("NinePatchRect/potHolder/highLightPots/potThreeH/myPlant/Anima")
	nodeData = Global.potData["potThreeH"]
	nodeToLoad.plantGrowing = nodeData.plantGrowing
	nodeToLoad.weeksAlive = nodeData.weeksAlive
	nodeToLoad.isHarvestable = nodeData.isHarvestable
	nodeToLoad.currPH = nodeData.currPH
	animaToLoad.play(nodeData.Anima)
	# assign fourth high light plant
	nodeToLoad = get_node("NinePatchRect/potHolder/highLightPots/potFourH/myPlant")
	animaToLoad = get_node("NinePatchRect/potHolder/highLightPots/potFourH/myPlant/Anima")
	nodeData = Global.potData["potFourH"]
	nodeToLoad.plantGrowing = nodeData.plantGrowing
	nodeToLoad.weeksAlive = nodeData.weeksAlive
	nodeToLoad.isHarvestable = nodeData.isHarvestable
	nodeToLoad.currPH = nodeData.currPH
	animaToLoad.play(nodeData.Anima)
	# assign fith high light plant
	nodeToLoad = get_node("NinePatchRect/potHolder/highLightPots/potFiveH/myPlant")
	animaToLoad = get_node("NinePatchRect/potHolder/highLightPots/potFiveH/myPlant/Anima")
	nodeData = Global.potData["potFiveH"]
	nodeToLoad.plantGrowing = nodeData.plantGrowing
	nodeToLoad.weeksAlive = nodeData.weeksAlive
	nodeToLoad.isHarvestable = nodeData.isHarvestable
	nodeToLoad.currPH = nodeData.currPH
	animaToLoad.play(nodeData.Anima)
	# assign variables to first low light plant
	nodeToLoad = get_node("NinePatchRect/potHolder/lowLightPots/potOneL/lowLightPlant")
	animaToLoad = get_node("NinePatchRect/potHolder/lowLightPots/potOneL/lowLightPlant/Anima")
	nodeData = Global.potData["potOneL"]
	nodeToLoad.plantGrowing = nodeData.plantGrowing
	nodeToLoad.weeksAlive = nodeData.weeksAlive
	nodeToLoad.isHarvestable = nodeData.isHarvestable
	nodeToLoad.currPH = nodeData.currPH
	animaToLoad.play(nodeData.Anima)
	# assign variables to second low light plant
	nodeToLoad = get_node("NinePatchRect/potHolder/lowLightPots/potTwoL/lowLightPlant")
	animaToLoad = get_node("NinePatchRect/potHolder/lowLightPots/potTwoL/lowLightPlant/Anima")
	nodeData = Global.potData["potTwoL"]
	nodeToLoad.plantGrowing = nodeData.plantGrowing
	nodeToLoad.weeksAlive = nodeData.weeksAlive
	nodeToLoad.isHarvestable = nodeData.isHarvestable
	nodeToLoad.currPH = nodeData.currPH
	animaToLoad.play(nodeData.Anima)
	# assign variables to third low light plant
	nodeToLoad = get_node("NinePatchRect/potHolder/lowLightPots/potThreeL/lowLightPlant")
	animaToLoad = get_node("NinePatchRect/potHolder/lowLightPots/potThreeL/lowLightPlant/Anima")
	nodeData = Global.potData["potThreeL"]
	nodeToLoad.plantGrowing = nodeData.plantGrowing
	nodeToLoad.weeksAlive = nodeData.weeksAlive
	nodeToLoad.isHarvestable = nodeData.isHarvestable
	nodeToLoad.currPH = nodeData.currPH
	animaToLoad.play(nodeData.Anima)
	# assign variables to Fourth low light plant
	nodeToLoad = get_node("NinePatchRect/potHolder/lowLightPots/potFourL/lowLightPlant")
	animaToLoad = get_node("NinePatchRect/potHolder/lowLightPots/potFourL/lowLightPlant/Anima")
	nodeData = Global.potData["potFourL"]
	nodeToLoad.plantGrowing = nodeData.plantGrowing
	nodeToLoad.weeksAlive = nodeData.weeksAlive
	nodeToLoad.isHarvestable = nodeData.isHarvestable
	nodeToLoad.currPH = nodeData.currPH
	animaToLoad.play(nodeData.Anima)
	# assign variables to Fifth low light plant
	nodeToLoad = get_node("NinePatchRect/potHolder/lowLightPots/potFiveL/lowLightPlant")
	animaToLoad = get_node("NinePatchRect/potHolder/lowLightPots/potFiveL/lowLightPlant/Anima")
	nodeData = Global.potData["potFiveL"]
	nodeToLoad.plantGrowing = nodeData.plantGrowing
	nodeToLoad.weeksAlive = nodeData.weeksAlive
	nodeToLoad.isHarvestable = nodeData.isHarvestable
	nodeToLoad.currPH = nodeData.currPH
	animaToLoad.play(nodeData.Anima)
