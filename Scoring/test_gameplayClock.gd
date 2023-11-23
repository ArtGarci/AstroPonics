extends Node

var totalTestsRun = 0
var totalTestsPassed = 0

func _ready():
	test_weeks_passed_increment()
	test_gameplay_time_calculation()
	test_update_weeks_display()

	print("Total tests run: ", totalTestsRun)
	print("Total tests passed: ", totalTestsPassed)

func test_weeks_passed_increment():
	totalTestsRun += 1
	var clock = preload("res://WeekLabel.gd").new()
	clock._ready()
	clock._process(600)
	if clock.weeks_passed == 1:
		totalTestsPassed += 1
		print("test_weeks_passed_increment: Test passed.")
	else:
		print("test_weeks_passed_increment: Test failed.")

func test_gameplay_time_calculation():
	totalTestsRun += 1
	var clock = preload("res://WeekLabel.gd").new()
	clock._ready()
	clock._process(600)  # Simulate 10 minutes
	if clock.get_gameplay_time() == 600:
		totalTestsPassed += 1
		print("test_gameplay_time_calculation: Test passed.")
	else:
		print("test_gameplay_time_calculation: Test failed.")


func test_update_weeks_display():
	totalTestsRun += 1
	var clock = preload("res://WeekLabel.gd").new()
	clock._ready()
	clock._process(600)  # Simulate 10 minutes
	if clock.text == "1/12":
		totalTestsPassed += 1
		print("test_update_weeks_display: Test passed.")
	else:
		print("test_update_weeks_display: Test failed.")

