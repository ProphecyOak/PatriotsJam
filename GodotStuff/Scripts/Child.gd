extends AnimatedSprite2D

var isCrying: bool = false
var location: int = 0

var midScreen = Vector2(570,300)

func _input(event):
	if isCrying:
		if event is InputEventKey && event.keycode == 83 && $"../..".isWatchingCrib:
			soothe()
	else:
		if event is InputEventMouseButton && event.button_index == 1 && event.pressed == true:
			print(get_global_mouse_position())
			if get_global_mouse_position().y > midScreen.y:
				if get_global_mouse_position().x > midScreen.x:
					play("BottomRight")
				else:
					play("BottomLeft")
			else:
				if get_global_mouse_position().x > midScreen.x:
					play("TopRight")
				else:
					play("TopLeft")

func move():
	pass

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
