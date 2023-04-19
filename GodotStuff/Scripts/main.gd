extends Node2D

var isWatchingCrib = false

func _input(event):
	if event is InputEventKey && event.keycode==Global.cribToggleKey && event.is_pressed():
		isWatchingCrib = !isWatchingCrib
		$CribView.visible = isWatchingCrib
		$RoomMonsters.visible = !isWatchingCrib
