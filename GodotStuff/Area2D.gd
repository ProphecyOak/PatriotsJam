extends Area2D

signal charge

func _process(delta):
	if Global.isWatchingCrib:
		visible = false
	else:
		visible = true


func _input(event):
	if event is InputEventMouseButton && event.button_index == 1 && !Global.isWatchingCrib:
		if get_overlapping_areas().size() > 0: 
			emit_signal("charge")
