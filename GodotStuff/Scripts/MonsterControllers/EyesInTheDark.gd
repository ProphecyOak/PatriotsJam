extends  Monster

#var for blink animation max time
@export var blinkMaxTime: int = 5;

func _ready():
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

#Animation behavior/ resetting timer
#_on_animatopn_timer_timeout(): void
func _on_animation_timer_timeout():
	$AnimationPlayer.play("blink")
	$animationTimer.start(randi_range(0,blinkMaxTime))
	
