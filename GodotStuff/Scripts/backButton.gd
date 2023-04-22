extends Button


func _on_pressed():
	Global.toggleGameNotOver()
	get_tree().change_scene_to_file("res://Scenes/startMenu.tscn")
