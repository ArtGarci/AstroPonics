extends ParallaxBackground

# Infinitely scrolling background on Y axis
func _process(delta):
	scroll_base_offset -= Vector2(0,-5) * delta
