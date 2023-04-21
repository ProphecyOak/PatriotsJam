extends  Monster

#var for blink animation max time
@export var blinkMaxTime: int = 5;

#toggles camera zoom
signal zoomCamera

func _ready():
	super()
	$animationTimer.start(randi_range(0,6));

#Spotted behavior. Default just hides monster if not evil
#onSpotted(): void
func onSpotted():
	super()

#Unspotted behavior. Restarts evil timer. Default just shows monster
#onUnspotted(): void
func onUnspotted():
	super()

#Evil behavior
#doEvil(): void
func doEvil():
	super()
	position = Vector2(600, 372)
	$Scare.visible = true;
	emit_signal("zoomCamera")
	$Scare.play("jumpScare")
	$open.visible = false;
	$mid.visible = false;
	$closed.visible = false;
	$scareSound.play()
	await get_tree().create_timer(1).timeout
	get_tree().change_scene_to_file("res://Scenes/sample_end_screen.tscn")

#Animation behavior/ resetting timer
#_on_animatopn_timer_timeout(): void
func _on_animation_timer_timeout():
	$AnimationPlayer.play("blink")
	$animationTimer.start(randi_range(0,blinkMaxTime))
	
