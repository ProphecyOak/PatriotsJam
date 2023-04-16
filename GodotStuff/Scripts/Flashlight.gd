extends Sprite2D

func _input(event):
	if event is InputEventMouseMotion:
		set_global_position(event.position)
