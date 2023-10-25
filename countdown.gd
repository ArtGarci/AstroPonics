extends Control

# THIS CONTAINS AN ALARM_TIMER NODE + gauge bar GUI 

@export var seconds = 0

var dsec = 0 

# Called when the node enters the scene tree for the first time.
func _ready(): 
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	if (seconds > 0 and dsec <= 0):
		seconds -=1
		dsec = 10 

	if (seconds >= 10):
		$TimerLabel.set_fill_mode(100)
	else:
		$TimerLabel.value += 1
	

func _on_alarm_timer_timeout():
	dsec -= 1 
	pass # Replace with function body.
