extends Area2D

signal charge

func _input(event):
	if event is InputEventMouseButton && event.button_index == 1 && !Global.isWatchingCrib && !Global.soothing:
		if get_overlapping_areas().size() > 0: 
			emit_signal("charge")
