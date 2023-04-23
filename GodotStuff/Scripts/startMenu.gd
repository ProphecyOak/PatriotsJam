extends Control

func _ready():
	$morningSounds.play()

func _on_start_pressed():
	get_tree().change_scene_to_file("res://Scenes/main.tscn")

func _on_options_pressed():
	get_tree().change_scene_to_file("res://Scenes/options.tscn")

func _on_credits_pressed():
	get_tree().change_scene_to_file("res://Scenes/credits.tscn")
