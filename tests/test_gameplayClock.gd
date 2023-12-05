extends Node

var totalTestsRun = 0
var totalTestsPassed = 0

func _ready():
	test_weeks_passed_increment()
	test_gameplay_time_calculation()
	test_update_weeks_display()
	test_weeks_button_increment()

	print("Total tests run: ", totalTestsRun)
	print("Total tests passed: ", totalTestsPassed)

func test_weeks_passed_increment():
	totalTestsRun += 1
	var clock = preload("res://gdScipts/WeekLabel.gd").new()
	# Simulate the game running for 1 week
	clock.elapsed_real_time = clock.seconds_per_gameplay_week
	clock._process(0)  # Simulate the _process function being called
	var global_singleton = get_node("/root/Global")
	
	if global_singleton.weeks_passed == 1:
		totalTestsPassed += 1
		print("test_weeks_passed_increment: Test passed.")
	else:
		print("test_weeks_passed_increment: Test failed.")

func test_weeks_button_increment():
	totalTestsRun += 1
	var clock = preload("res://gdScipts/WeekLabel.gd").new()
	var global_singleton = get_node("/root/Global")
	
	var original_weeks = global_singleton.weeks_passed
	clock._on_next_week_button_pressed()
	if global_singleton.weeks_passed == original_weeks + 1:
		totalTestsPassed += 1
		print("test_weeks_button_increment: Test passed.")
	else:
		print("test_weeks_button_increment: Test failed.")
	

func test_gameplay_time_calculation():
	totalTestsRun += 1
	var clock = preload("res://gdScipts/WeekLabel.gd").new()
	clock.elapsed_real_time = clock.seconds_per_gameplay_week / 12
	clock._process(0)  # Simulate 5 minutes
	if clock.get_gameplay_time() == 300:
		totalTestsPassed += 1
		print("test_gameplay_time_calculation: Test passed.")
	else:
		print("test_gameplay_time_calculation: Test failed.")


func test_update_weeks_display():
	totalTestsRun += 1
	var clock = preload("res://gdScipts/WeekLabel.gd").new()
	var global_singleton = get_node("/root/Global")
	global_singleton.weeks_passed = 1
	clock.update_weeks_display()

	if clock.text == "1/12":
		totalTestsPassed += 1
		print("test_update_weeks_display: Test passed.")
	else:
		print("test_update_weeks_display: Test failed.")

