extends Sprite2D

func _input(event):
	if event is InputEventMouseMotion:
		set_global_position(event.position)

func litAreaEntered(area):
	if area.get_script().get_path().get_file() == "hidden_eyes.gd":
		area.inLight = true
		if area.visible:
			area.spotted()

func litAreaExited(area):
	if area.get_script().get_path().get_file() == "hidden_eyes.gd":
		area.inLight = false
