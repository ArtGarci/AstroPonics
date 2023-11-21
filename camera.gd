extends Camera2D

var RANDOM_SHAKE_STR: float = 50.0
var SHAKE_DECAY_RATE: float = 5.0
var rand = RandomNumberGenerator.new() 
var shake_strength: float = 0.0 
var noise = FastNoiseLite.new() # for better shakes , add later.
var shake = false 
# Called when the node enters the scene tree for the first time.
func _ready():
	set_process(true) # going to shake!
	rand.randomize() 
	shake_strength = RANDOM_SHAKE_STR 

func get_random_offset() -> Vector2 :
	return Vector2(
		rand.randf_range(-shake_strength, shake_strength),
		rand.randf_range(-shake_strength, shake_strength)
	)
	
func camera_effect():
	offset = get_random_offset() # move camera
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	shake_strength = lerp(shake_strength,shake_strength, SHAKE_DECAY_RATE * delta)
	if (shake):
		camera_effect() 
	

