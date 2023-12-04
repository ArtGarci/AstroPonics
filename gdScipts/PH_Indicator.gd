extends Sprite2D

var tween
var sprite 
var text
# Called when the node enters the scene tree for the first time.
func _ready():
	tween = create_tween() # first tweem
	sprite = get_node("/root/Game2/RandomEvents/PH_UI")
	text = get_node("/root/Game2/RandomEvents/re_display")

# this animation shows to the user PH got changed!
func callAnimation() -> void:
	if (tween): # tweens are not designed to be re-used 
		tween.kill() # abort 
	# seperates WHAT w/ HOW 
	tween = create_tween().set_parallel(true).set_loops() #binds object w/ tween
	var start = Vector2(0,0)
	var end = Vector2(100, 400)
	tween.tween_property(self, "position", 
		end, 1).from(start)
	tween.tween_property(self, "modulate", Color.RED, 1).set_trans(Tween.TRANS_SINE)
	sprite_kids()
	ghost_effect()
	tween.chain().tween_interval(0.94)
	tween.play()
	await tween.finished
	tween.tween_callback(callAnimation) # loop
	#ueue_free() - reusing over & over hence can't free 

func ghost_effect():
	var tween_fade = create_tween()
	tween_fade.tween_property(self, "self_modulate", Color(1,1, 1, 0), 0.75)
	# await tween_fade.finished

func sprite_kids(): # children's nodes animate
	if (tween):
		tween.kill()
	tween = create_tween() 
	var start = Vector2(0,0)
	var end = Vector2(100, 200)
	for sprite in get_children():
		tween.tween_property(sprite, "self_modulate", Color.BLUE_VIOLET, 0.75) # FADE 
		tween.tween_property(sprite, "position",
			 end, 1).set_trans(Tween.TRANS_BOUNCE).from(start)
		tween.tween_property(sprite, "position",
			 Vector2(100, 400), 1).from_current()
		tween.tween_property(sprite, "position",
			 start, 1).set_trans(Tween.TRANS_BOUNCE).from(end)
		tween.tween_property(sprite, "modulate", 
			Color.RED, 1).set_trans(Tween.TRANS_SINE)
		tween.tween_property(sprite, "self_modulate", Color(1,1,1,0), 0.75) # FADE 
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
