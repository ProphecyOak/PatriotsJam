extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	$lightOn.play()
	$Camera2D.zoom.x = 1;
	$Camera2D.zoom.y = 1;

func _on_light_on_finished():
	$footSteps.play()
	$AnimationPlayer.play("walkingUp")

func _on_animation_player_animation_finished(anim_name):
	if anim_name == "walkingUp":
		await get_tree().create_timer(.6).timeout
		get_tree().change_scene_to_file("res://Scenes/baby_good_scene.tscn")
