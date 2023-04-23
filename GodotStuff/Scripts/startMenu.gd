extends Control

func _ready():
	$morningSounds.play()

func _on_start_pressed():
	get_tree().change_scene_to_file("res://Scenes/main.tscn")

func _on_options_pressed():
	$StartMenu.visible = false
	$Options.visible = true

func _on_credits_pressed():
	$StartMenu.visible = false
	$Credits.visible = true


func _on_how_to_play_pressed():
	$StartMenu.visible = false
	$HowToPlay.visible = true
