extends Control


@onready var spriteOneAnimH = $NinePatchRect/potHolder/highLightPots/potOneH/sOnePlant
@onready var spriteTwoAnimH = $NinePatchRect/potHolder/highLightPots/potTwoH/sTwoPlant
var plantGrowing1 = false
var plantGrowing2 = false


func _on_pot_one_h_area_entered(area):
	if Global.lightLevel == 2:
		if Global.seedSelected == 0:
			spriteOneAnimH.play("none")
			plantGrowing1 = false
		if Global.seedSelected == 4 and plantGrowing1 == false:
			spriteOneAnimH.play("potatoeGrow")
			plantGrowing1 = true
		if Global.seedSelected == 5 and plantGrowing1 == false:
			spriteOneAnimH.play("wheatGrow")
			plantGrowing1 = true
		if Global.seedSelected == 6 and plantGrowing1 == false:
			spriteOneAnimH.play("tomatoeGrow")
			plantGrowing1 = true


func _on_pot_two_h_area_entered(area):
	if Global.lightLevel == 2:
		if Global.seedSelected == 0:
			spriteTwoAnimH.play("none")
			plantGrowing2 = false
		if Global.seedSelected == 4 and plantGrowing2 == false:
			spriteTwoAnimH.play("potatoeGrow")
			plantGrowing2 = true
		if Global.seedSelected == 5 and plantGrowing2 == false:
			spriteTwoAnimH.play("wheatGrow")
			plantGrowing2 = true
		if Global.seedSelected == 6 and plantGrowing2 == false:
			spriteTwoAnimH.play("tomatoeGrow")
			plantGrowing2 = true


func _on_pot_four_h_area_entered(area):
	if Global.lightLevel == 2:
		if Global.lightLevel == 2:
			print("in pot 2 low area")


func _on_pot_five_h_area_entered(area):
	if Global.lightLevel == 2:
		if Global.lightLevel == 2:
			print("in pot 2 low area")


func _on_pot_one_l_area_entered(area):
	if Global.lightLevel == 1:
		print("in pot 2 low area")


func _on_pot_two_l_area_entered(area):
	if Global.lightLevel == 1:
		print("in pot 2 low area")


func _on_pot_three_l_area_entered(area):
	if Global.lightLevel == 1:
		print("in pot 3 low area")


func _on_pot_four_l_area_entered(area):
	if Global.lightLevel == 1:
		print("in pot 4 low area")


func _on_pot_five_l_area_entered(area):
	if Global.lightLevel == 1:
		print("in pot 5 low area")

