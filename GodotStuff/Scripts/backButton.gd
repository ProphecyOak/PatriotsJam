extends Button


func _on_pressed():
	if Global.gameOver:
		Global.toggleGameNotOver()
		get_tree().change_scene_to_file("res://Scenes/startMenu.tscn")
	else:
		$"..".visible = false
		$"../../StartMenu".visible = true
