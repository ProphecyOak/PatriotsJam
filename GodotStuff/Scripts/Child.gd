extends AnimatedSprite2D

var isCrying: bool = false
var location: String = "TopRight"

var midScreen = Vector2(570,300)

func _input(event):
	if isCrying:
		if event is InputEventKey && event.keycode == 83 && Global.isWatchingCrib:
			soothe()
	else:
		if event is InputEventMouseButton && event.button_index == 1 && event.pressed == true:
			if get_global_mouse_position().y > midScreen.y:
				if get_global_mouse_position().x > midScreen.x:
					play("BottomRight")
					location = "BottomRight"
				else:
					play("BottomLeft")
					location = "BottomLeft"
			else:
				if get_global_mouse_position().x > midScreen.x:
					play("TopRight")
					location = "TopRight"
				else:
					play("TopLeft")
					location = "TopLeft"

func _on_cry_timer_timeout():
	if randf() > .5:
		cry()
	else:
		$CryTimer.start()

func cry():
	isCrying = true
	$Cry.play()

func soothe():
	isCrying = false
	$CryTimer.start()
	$Cry.stop()
