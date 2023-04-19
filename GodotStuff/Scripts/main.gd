extends Node2D

var isWatchingCrib = false

func _ready():
	$NightTimer.start(Global.timeTillWin)

func _input(event):
	if event is InputEventKey && event.keycode==Global.cribToggleKey && event.is_pressed():
		isWatchingCrib = !isWatchingCrib
		$CribView.visible = isWatchingCrib
		$RoomMonsters.visible = !isWatchingCrib

func NightOver():
	Global.won = true
	get_tree().change_scene_to_file("res://Scenes/sample_end_screen.tscn")
