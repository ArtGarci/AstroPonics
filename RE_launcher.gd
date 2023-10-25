extends Node

var spawnerObject; # RE launcher one for the random events it generates.
 
# how to use: 
# ASSUMING CALLING FROM EXTERNAL NODE 
# has _read() then does not need .new(), simply call .launch() 
# var script = preload("res://re_launcher.gd").new();
# RE_launcher.launch(20); // WHERE 20 IS THE PERCENTAGE, IT GETS HANDLED INTO FLOAT

var rng = RandomNumberGenerator.new()
var timerStarted = false 
var overlay : ShaderMaterial 
# signal stuff 
signal camera_effect
# signal distort_effect # its a shader 

func _init(): # CONSTRUCTOR, built before child nodes 
	pass

# Called when the node enters the scene tree for the first time. child nodes come back ready() 
func _ready():
	pass  

func cam_effect():
	emit_signal("camera_effect")
	
# SUCCESS! now call a random event. 
func activateRE():
	
	if !timerStarted: # or $Alarm_Timer.is_stopped() 
		timerStarted = true 
	spawnerObject = rng.randi_range(0,4) 
	match spawnerObject:
		1: # DISTORT
		# attempting (material as ShaderMaterial).set_shader_parameter("parameter", value)
		#	overlay = get_node("$Overlay").getmaterial()
		#	overlay.set_shader_param("onoff", 1.0)
			# insert countdown timer here... instead of this code
			var t = Timer.new()
			t.set_wait_time(3)
			t.set_one_shot(true)
			t.start()
		#	overlay.material.set_shader_param("onoff", 0.0)
			t.queue_free()
		2: # SHAKE SCREEN 
			cam_effect()
		# 3: # DUST particles floating in air  
		# get_node("Dust").show() 
		#4: PERIODIC screen crack / glitch?
		#5: # PH IMBALANCE
	
	
func launcher(rndNum): 
	rng.randomize() 
	var myRndNum = rng.randf_range(0, 1); # 0 to 100% chance
	if (myRndNum <= rndNum):
		print("succesful hit!")
		activateRE();

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta): 
	self.launcher(2) 
	pass

