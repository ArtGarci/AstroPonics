extends Sprite2D

signal plant_clicked

var start_scale = Vector2(.2, .2)  # Initial scale
var end_scale = Vector2(.3, .3)  # Scale to grow to
var duration = 0.5  # Duration of one half of the animation
var timer = 0.0  # Keeps track of time
var growing = true  # Toggle between growing and shrinking
var animation_started = false  # Flag to control the start of the animation
var delay_duration = randf_range(1.0, 5.0)  # Random delay duration

# Called when the node enters the scene tree for the first time.
func _ready():
	set_process_input(true)

func _process(delta):
	if not animation_started:
		delay_duration -= delta
		if delay_duration <= 0:
			animation_started = true
			timer = 0.0  # Reset the animation timer

	if animation_started:
		timer += delta

		# Calculate interpolation factor
		var t = timer / duration
		t = min(t, 1.0)  # Clamp the value to be between 0 and 1

		if growing:
			scale = start_scale.lerp(end_scale, t)
		else:
			scale = end_scale.lerp(start_scale, t)

		# Reset and change direction
		if timer >= duration:
			timer = 0.0
			growing = !growing

func _input(event):
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT and animation_started == true:
		if get_rect().has_point(to_local(event.position)):
			emit_signal("plant_clicked")
			reset_animation_delay()

func reset_animation_delay():
	delay_duration = randf_range(1.0, 5.0)  # Reset the delay to a new random duration
	animation_started = false  # Stop the animation
