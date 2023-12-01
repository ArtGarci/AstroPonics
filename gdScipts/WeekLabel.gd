extends Label

var weeks_passed = 0  # Initialize the number of weeks
var elapsed_real_time = 0  # Initialize the elapsed real-time
var seconds_per_gameplay_week = 10 * 30  # 5 minutes in seconds
var re_time =  3 * 60 # RANDOM EVENT TRIGGER TIME, SELF-CLOCK
var elapsed_re_time = 0 # for RE seconds

var t
func _ready():
	RE.build() 
	t = RE.new() 
	add_child(t)
	update_weeks_display()
	GlobalScoreLabel.set_score("TEST", 0)

func _process(delta):
	# Update elapsed real-time
	elapsed_real_time += delta
	elapsed_re_time += delta 
	# Check if a week has passed
	if elapsed_real_time >= seconds_per_gameplay_week:
		weeks_passed += 1
		Global.nextWeekSignal.emit()
		elapsed_real_time -= seconds_per_gameplay_week
		update_weeks_display()
	# Check if 3 weeks has passed, then begin with random events launching.
	if (weeks_passed >= 3): 
		if elapsed_re_time >= re_time:
			elapsed_re_time -= re_time # RESET 
			t.launcher(20) # ASSUMES that the node presides on same scene

	#check if the game should end after 12 weeks
	if weeks_passed >=12:
		end_game() # call a function to end the game

func get_gameplay_time():
	# Return the total gameplay time in seconds
	return weeks_passed * seconds_per_gameplay_week

func update_weeks_display():
	text = str(weeks_passed) + "/12"
	
func end_game():
	#access the current scene make call to exit game
	get_tree().quit()
	
	
func _on_button_pressed():
	weeks_passed += 1
	Global.nextWeekSignal.emit()
	update_weeks_display()
	
	#check if 3 weeks have passed, then begin with random events launching
	if weeks_passed >= 3 and elapsed_re_time >= re_time:
		elapsed_re_time -= re_time  # RESET
		t.launcher(20)  # ASSUMES that the node presides on the same scene
	
	#check if the game should end after 12 weeks have passed
	if weeks_passed >= 12:
		end_game()
		
	
