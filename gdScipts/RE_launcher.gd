# how to use: (ASSUMING CALLING FROM EXTERNAL NODE !
# global var t
#_ready():
#	t = RE.new()
#	add_child(t)
#func _process(delta):
#	t.launcher(20)

class_name RE 
# export (Material) var material1 setget mat1
extends Label # changed from Node to Label now to try to show text that RE started
# had to make a child node of RE label to show animated text for now ... ^ 
var spawnerObject; # RE launcher one for the random events it generates.
var currRunning = false; # bool that says if it is running an event 
# GENERATION OF NODES TO SCENE 
var rng = RandomNumberGenerator.new()
var timerStarted = false 
var alarm_node
var ph_ui_node # indicates 2 user that PH went down.
var overlay : ShaderMaterial 
var distort_shader : Shader
var blur_shade : Shader
var blur_shade_mat : ShaderMaterial
var crt : Shader 
var crt_effect : ShaderMaterial # using Overlay as centralized point for shaders.
var overlay_node
var camera_node
var animate_text
var re_counter = 0 # how many times RE events? for debugging purposes

# signal PHEFFECT # define signal object 4 RE 

func _init(): # CONSTRUCTOR, built before child nodes 
	pass
	
static func build():
	pass 

# Called when the node enters the scene tree for the first time. child nodes come back ready() 
func _ready():
	#alarm set 
	alarm_node = get_node("/root/Game2/RandomEvents/Alarm")
	# ph 
	ph_ui_node = get_node("/root/Game2/RandomEvents/PH_UI")
	# OVERLAY NODE - DISTORTION DEFAULT
	overlay_node = get_node("/root/Game2/Overlay")
	overlay_node.set_visible(true)
	overlay = overlay_node.get_material()
	# blur 
	blur_shade = preload("res://gdScipts/blur.gdshader")
	blur_shade_mat = ShaderMaterial.new()
	blur_shade_mat.set_shader(blur_shade)
	# distort 
	distort_shader = preload("res://distort.gdshader")
	# CRT 
	crt = preload("res://gdScipts/crt.gdshader")
	crt_effect = ShaderMaterial.new()
	crt_effect.set_shader(crt)
	# CAMERA NODE
	camera_node = get_node("/root/Game2/Camera2D")
	animate_text = get_node("/root/Game2/RandomEvents/AnimateText")

func get_curr():
	return currRunning; 
	
func alarm_blare(): # set animate text visiblity
	animate_text.visible = true
	alarm_node.visible = true
	alarm_node.animate()
	
func cutscene():
	pass
	
func cam_effect(): 
	camera_node.camera_effect()

func activateRE(): # SUCCESS! now call a random event. 
	currRunning = true 
	alarm_blare()
	await get_tree().create_timer(3).timeout # wait 3 secs, gives user time.
	if !timerStarted: # or $Alarm_Timer.is_stopped() 
		timerStarted = true
	animate_text.visible = false 
	spawnerObject = rng.randi_range(1,4) # RANGES 1->5
	match spawnerObject:
		1: # PH IMBALANCE 
			#push_warning("PH effect")
			ph_ui_node.visible = true
			ph_ui_node.callAnimation() # animate w/ arrows down
			await get_tree().create_timer(2).timeout
			Global.PHEFFECT.emit(true)
			ph_ui_node.visible = false
		#1: BLUR EFFECT
		#	push_warning("blur effect")
		#	overlay_node.material.shader = blur_shade_mat
			#ba = wrapf(ba + 0.05, 0.0, 5.0)
			#overlay.set_shader_parameter("blur_amount", ba)
		#	await get_tree().create_timer(2).timeout
		#	overlay_node.material.shader = distort_shader 
		2: # DISTORT
			#push_warning("distortion")
			overlay_node.set_material(overlay)
			overlay.set_shader_parameter("onoff", 1.0)
			await get_tree().create_timer(5).timeout # wait 5 secs 
			overlay.set_shader_parameter("onoff", 0.0)
		3: # SHAKE SCREEN
			#push_warning("screen shake") 
			camera_node.set("shake", true)
			await get_tree().create_timer(5).timeout # wait 5 secs 
			camera_node.set("shake", false)
		4: # CRT MONITOR EFFECT
			#push_warning("crt effect")
			overlay_node.material.shader = crt
			await get_tree().create_timer(5).timeout # wait 5 secs 
			overlay_node.material.shader = distort_shader
		5: # PH IMBALANCE
			#push_warning("PH effect")
			ph_ui_node.visible = true
			ph_ui_node.callAnimation() # animate w/ arrows down
			await get_tree().create_timer(2).timeout
			Global.PHEFFECT.emit(true)
			ph_ui_node.visible = false
		
	alarm_node.visible = false 
	currRunning = false
	timerStarted = false
	
func launcher(rndNum): 
	var chance = rng.randf_range(0, 100); # 0 to 100% chance
	if (chance <= rndNum):
		#push_warning("succesful hit!")
		activateRE(); # ALARM BLARES !!
	#else: 
		#push_warning("not successful!")
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta): 
	pass
