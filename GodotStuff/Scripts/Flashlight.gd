extends Sprite2D

func _input(event):
	if event is InputEventMouseMotion:
		set_global_position(event.position)

func litAreaEntered(area):
	if area.isEyes:
		if area.visible:
			area.inLight = true
			area.spotted()


func litAreaExited(area):
	if area.isEyes:
		area.inLight = false
