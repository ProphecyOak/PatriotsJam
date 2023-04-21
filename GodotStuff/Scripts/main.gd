extends Node2D


func _ready():
	$NightTimer.start(Global.timeTillWin)
	Global.mainCam = $Camera2D
	Global.flashlight = $Flashlight

func _input(event):
	if event is InputEventKey && event.keycode==Global.cribToggleKey && event.is_pressed():
		Global.isWatchingCrib = !Global.isWatchingCrib
		$CribView.showCrib(Global.isWatchingCrib)
		$RoomMonsters.visible = !Global.isWatchingCrib

func NightOver():
	Global.won = true
	get_tree().change_scene_to_file("res://Scenes/sample_end_screen.tscn")

var shake_amount = 15.0

func _process(_delta):
	if Global.gameOver:
		$Camera2D.set_offset(Vector2( \
			randi_range(-1, 1) * shake_amount, \
			randi_range(-1, 1) * shake_amount \
		))		#DEBUG
		$RoomMonsters.visible = true


func _on_gnome_zoom_camera():
	$Camera2D.zoom.x += 1
	$Camera2D.zoom.y += 1


func _on_eyes_in_the_dark_zoom_camera():
	$Camera2D.zoom.x += 1
	$Camera2D.zoom.y += 1
