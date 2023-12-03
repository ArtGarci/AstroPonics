extends Node

var seedSelected = 0 # 1=lettace 2=radish 3=chives 4=potatoes 5=wheat 6=tomatoes
var lightLevel = 0 #1=low,2=high
var itSeed = false
var itTrowel = false
var microGameScore = 0
var microGameType = ""
var potData = {} 
#tmp for making plants work
signal nextWeekSignal
signal PHEFFECT # why not ;p;
signal MICRO
signal SAVE
signal LOAD
signal GLOBALLOAD


func _ready():
	connect("GLOBALLOAD", Callable(self, "loadData"))

func loadData():
	await get_tree().create_timer(.5).timeout
	if(get_tree().current_scene.name == "Game2"):
		LOAD.emit()
