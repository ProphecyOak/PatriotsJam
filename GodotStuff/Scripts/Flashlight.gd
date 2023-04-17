extends Area2D

var isLightOn: bool = false
@onready var percentIndicator = $"../Battery Remaining"

func _ready():
	$BatteryTimer.start(100)
	$BatteryTimer.set_paused(true)

func _process(_delta):
	percentIndicator.text = str(roundi($BatteryTimer.time_left))+"%"

func _input(event):
	if event is InputEventMouseMotion:
		set_global_position(event.position)
	elif event is InputEventMouseButton:
		if event.button_index == 1 && event.pressed == true:
			switchFlashlight()
		
func switchFlashlight():
	lightAudioHandler()
	isLightOn = !isLightOn
	visible = isLightOn
	batteryHandler()

func lightAudioHandler():
	if isLightOn:
		$on.play()
	else:
		$off.play()

func batteryHandler():
	$BatteryTimer.set_paused(!isLightOn)


func litAreaEntered(area):
	if area.has_method("spotted"):
		area.spotted()

func litAreaExited(area):
	if area.has_method("unspotted"):
		area.unspotted()
		
