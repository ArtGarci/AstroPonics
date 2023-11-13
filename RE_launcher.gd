extends Node

var spawnerObject; # RE launcher one for the random events it generates.
var currRunning = false; # bool that says if it is running an event 
 
# how to use: 
# ASSUMING CALLING FROM EXTERNAL NODE 
# has _read() then does not need .new(), simply call .launch() 
# var script = preload("res://re_launcher.gd").new();
# RE_launcher.launch(20); // WHERE 20 (default) IS THE PERCENTAGE, IT GETS HANDLED INTO FLOAT
var rng = RandomNumberGenerator.new()
var timerStarted = false 
var overlay : ShaderMaterial 
# signal stuff 

func _init(): # CONSTRUCTOR, built before child nodes 
	pass

# Called when the node enters the scene tree for the first time. child nodes come back ready() 
func _ready():
	overlay = $Overlay.get_material()
	pass  

func get_curr():
	return currRunning; 

func cam_effect():
	$Camera2D.camera_effect()
# SUCCESS! now call a random event. 
func activateRE():
	currRunning = true 
	get_node("Alarm").show()
	if !timerStarted: # or $Alarm_Timer.is_stopped() 
		timerStarted = true 
	spawnerObject = rng.randi_range(1,2) 
	match spawnerObject:
		1: # DISTORT
			overlay.set_shader_parameter("onoff", 1.0)
			# insert countdown timer here... instead of this code
			overlay.set_shader_parameter("onoff", 0.0)
			
		2: # SHAKE SCREEN 
			cam_effect()
		# 3: # DUST particles floating in air  
		# get_node("Dust").show() 
		#4: PERIODIC screen crack / glitch?
		#5: # PH IMBALANCE
	timerStarted = false
	
func launcher(rndNum): 
	rng.randomize() 
	var myRndNum = rng.randf_range(0, 1); # 0 to 100% chance
	if (myRndNum <= rndNum):
		push_warning("succesful hit!")
		activateRE();
		await get_tree().create_timer(3).timeout # wait 3 secs 
		currRunning = false # reset 
		get_node("Alarm").hide()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta): 
	self.launcher(100) # calls script sees if works 
	pass

