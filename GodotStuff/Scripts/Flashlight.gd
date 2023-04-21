extends Area2D

var isLightOn: bool = false
@onready var percentIndicator = $"../Battery Remaining"

var pauseBattery = false;

var charging = false;

func _ready():
	$BatteryTimer.start(100)
	$BatteryTimer.set_paused(true)

func _process(_delta):
	percentIndicator.text = str(roundi($BatteryTimer.time_left))+"%"

func _input(event):
	if event is InputEventMouseMotion:
		set_global_position(event.position)
	elif event is InputEventMouseButton && event.button_index == 2 && event.pressed == true:
		switchFlashlight()
	elif event is InputEventKey && event.is_pressed() && event.keycode==Global.chargeKey:
		chargeHandler()

func switchFlashlight():
	if !pauseBattery:
		lightAudioHandler()
		isLightOn = !isLightOn
		visible = isLightOn
		for area in self.get_overlapping_areas():
			if area.is_in_group("Monster") && isLightOn:
				area.spotted();
		batteryHandler()

func lightAudioHandler():
	if isLightOn:
		$on.play()
	else:
		$off.play()

func batteryHandler():
	$BatteryTimer.set_paused(!isLightOn)


func litAreaEntered(area):
	if area.has_method("spotted") && isLightOn && !Global.isWatchingCrib:
		area.spotted()

func litAreaExited(area):
	if area.has_method("unspotted") && isLightOn && !Global.isWatchingCrib:
		area.unspotted()
		

func _on_battery_timer_timeout():
	visible = false
	isLightOn = false
	pauseBattery = true
	
#handle charging
func chargeHandler():
	$chargingSound.play()
	var currentBattery = $BatteryTimer.get_time_left()
	$BatteryTimer.set_paused(true)
	pauseBattery = true
	visible = false
	isLightOn = false
	await get_tree().create_timer(10).timeout
	$BatteryTimer.start(currentBattery + 10)
	pauseBattery = false


#Shuts down flashlight when jump scare occurs
#OPTIMIZE FOR ANY MONSTER!!!!

	
	


func _on_gnome_game_over():
	visible = false;
	pauseBattery = true
	isLightOn = false
	print("flashlight off!")


func _on_eyes_in_the_dark_game_over():
	visible = false;
	pauseBattery = true
	isLightOn = false
	print("flashlight off!")
