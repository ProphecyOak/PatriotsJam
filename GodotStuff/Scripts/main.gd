extends Node2D


func _ready():
	$NightTimer.start(Global.timeTillWin)
	Global.mainCam = $Camera2D
	Global.flashlight = $Flashlight
	Global.subtitleContainer = $UI/Subtitles

func _input(event):
	if event is InputEventKey && event.keycode==Global.cribToggleKey && event.is_pressed() && !$Flashlight.charging && !Global.soothing:
		Global.isWatchingCrib = !Global.isWatchingCrib
		$CribView.showCrib(Global.isWatchingCrib)
		$RoomMonsters.visible = !Global.isWatchingCrib
		$outletArea.visible = !Global.isWatchingCrib
	if event is InputEventKey && event.keycode==Global.muteToggleKey && event.is_pressed():
		Global.toggleSounds()

func NightOver():
	if $"CribView/Lamia".isEvil:
		$"CribView/Lamia".checkJumpScare()
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
	$RoomMonsters/WindowHider/daylightColor.color = Color(.2,.7,1, (Global.timeTillWin - $NightTimer.get_time_left())/Global.timeTillWin )
