extends Node2D

@onready var spriteAnim = $lowPlant
var plantGrowing = false

# 1=lettace 2=radish 3=chives 4=potatoes 5=wheat 6=tomatoes
# when the seed goes over a grow plot, the plant animation starts
func _on_low_plant_coll_area_entered(area):
	if area == get_node("/root/GUI/seedDrag/lettaceSeedDrag/Area2D") :
		if Global.lightLevel == 1:
			if Global.seedSelected == 0:
				spriteAnim.play("none")
				plantGrowing = false
			if Global.seedSelected == 1 and plantGrowing == false:
				spriteAnim.play("lettaceGrow")
				plantGrowing = true
			if Global.seedSelected == 2 and plantGrowing == false:
				spriteAnim.play("radishGrow")
				plantGrowing = true
			if Global.seedSelected == 3 and plantGrowing == false:
				spriteAnim.play("chivesGrow")
				plantGrowing = true
