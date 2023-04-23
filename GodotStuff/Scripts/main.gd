extends Node2D


func _ready():
	$NightTimer.start(Global.timeTillWin)
	Global.mainCam = $Camera2D
	Global.flashlight = $Flashlight
	Global.subtitleContainer = $UI/Subtitles

func _input(event):
	if event is InputEventKey && event.keycode==Global.cribToggleKey && event.is_pressed() && !$Flashlight.charging:
		Global.isWatchingCrib = !Global.isWatchingCrib
		$CribView.showCrib(Global.isWatchingCrib)
		$RoomMonsters.visible = !Global.isWatchingCrib
	if event is InputEventKey && event.keycode==Global.muteToggleKey && event.is_pressed():
		Global.toggleSounds()

func NightOver():
	Global.won = true
	get_tree().change_scene_to_file("res://Scenes/walkingUpScene.tscn")

var shake_amount = 15.0

var transparency = 0

func _process(_delta):
	transparency += _delta
	if Global.gameOver:
		$Camera2D.set_offset(Vector2( \
			randi_range(-1, 1) * shake_amount, \
			randi_range(-1, 1) * shake_amount \
		))		#DEBUG
		$RoomMonsters.visible = true
	print($NightTimer.get_time_left())
	$RoomMonsters/WindowHider/daylightColor.color = Color(.2,.7,1, (transparency) / 50 )
