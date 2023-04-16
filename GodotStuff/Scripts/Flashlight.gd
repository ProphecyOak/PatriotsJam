extends Area2D

func _input(event):
	if event is InputEventMouseMotion:
		set_global_position(event.position)

func litAreaEntered(area):
	if area.has_method("spotted"):
		area.spotted()

func litAreaExited(area):
	if area.has_method("unspotted"):
		area.unspotted()
