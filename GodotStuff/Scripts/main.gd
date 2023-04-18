extends Node2D

func _input(event):
	if event is InputEventKey && event.keycode==Global.cribToggleKey && event.is_pressed():
		$CribView.visible = !$CribView.visible
