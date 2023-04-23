extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	$Camera2D.zoom.x = 1
	$Camera2D.zoom.y = 1
	await get_tree().create_timer(.6).timeout
	$AnimationPlayer.play("zoom")

func _on_animation_player_animation_finished(anim_name):
	if anim_name == "zoom":
		await get_tree().create_timer(.6).timeout
		$sleepingBaby.visible = false
		$goodBaby.visible = true
		$victorySound.play()
