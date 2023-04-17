extends Area2D

func _ready():
	$batteryCountdown.start(100)
	

func _input(event):
	if event is InputEventMouseMotion:
		set_global_position(event.position)
	#in theory, clicking should go here too but
	#it continuously turns back on.. so i stuffed it
	#in _process for now
		
func _process(delta):
	#for dealing with turning light on and off
	if Input.is_action_just_released("leftClick"):
		lightAudioHandler(lightStatus())
		visible = false if lightStatus() else true
		print("click!")
	#for implementing simple flashlight battery
	batteryHandler()

func lightStatus():
	return visible;
	
func lightAudioHandler(status):
	if status == true:
		$on.play()
	else:
		$off.play()

func batteryHandler(): 
	if lightStatus() == false:
		$batteryCountdown.set_paused(true)
	else:
		$batteryCountdown.set_paused(false)
	print("Battery Left: " + str($batteryCountdown.time_left))


func litAreaEntered(area):
	if area.has_method("spotted"):
		area.spotted()

func litAreaExited(area):
	if area.has_method("unspotted"):
		area.unspotted()
		
