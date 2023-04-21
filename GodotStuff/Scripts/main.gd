extends Node2D


func _ready():
	$NightTimer.start(Global.timeTillWin)

func _input(event):
	if event is InputEventKey && event.keycode==Global.cribToggleKey && event.is_pressed():
		Global.isWatchingCrib = !Global.isWatchingCrib
		$CribView.showCrib(Global.isWatchingCrib)
		$RoomMonsters.visible = !Global.isWatchingCrib

func NightOver():
	Global.won = true
	get_tree().change_scene_to_file("res://Scenes/sample_end_screen.tscn")

var shake_amount = 15.0

func _process(delta):
	if Global.gameOver:
		$Camera2D.set_offset(Vector2( \
			randi_range(-1.0, 1.0) * shake_amount, \
			randi_range(-1.0, 1.0) * shake_amount \
		))		#DEBUG
		$RoomMonsters.visible = true


func _on_gnome_game_over():
	$Camera2D.zoom.x += 1;
	$Camera2D.zoom.y += 1;

	


func _on_eyes_in_the_dark_game_over():
	$Camera2D.zoom.x += 1;
	$Camera2D.zoom.y += 1;
