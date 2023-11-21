extends RichTextLabel

@export var speed : int = 5 
@export var fade : bool = false 

var time = 0
var sinT = 0
var isVisible = true # BOOL 
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func flashText():
	if !fade:
		if sinT > 0: 
			isVisible = true 
		else:
			isVisible = true	
	else:
		isVisible = true
		modulate.a = sinT


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	time += delta
	sinT = sin(time * speed)
	flashText()	
