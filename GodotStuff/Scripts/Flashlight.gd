extends Area2D

var isLightOn: bool = false
@onready var percentIndicator = $"../UI/Battery Remaining"

var pauseBattery = false

var charging = false
var chargePercent = 100
var chargeTimeLength = 10
var chargeAmount = 10

func _ready():
	$BatteryTimer.start(100)
	$BatteryTimer.set_paused(true)

func _process(_delta):
	chargePercent = $BatteryTimer.time_left
	if !$chargeTimer.is_stopped():
		chargePercent += (chargeAmount-$chargeTimer.time_left)
	chargePercent = min(chargePercent,100)
	percentIndicator.text = ("%3.1f" % chargePercent) + "%"

func _input(event):
	if event is InputEventMouseMotion:
		set_global_position(event.position)
	elif event is InputEventMouseButton && event.button_index == 2 && event.pressed == true && !Global.soothing:
		switchFlashlight()

func switchFlashlight():
	if !pauseBattery:
		if !isLightOn:
			Global.makeSubtitle($on,0,"Flashlight Clicks On",.5)
		else:
			Global.makeSubtitle($off,0,"Flashlight Clicks Off",.5)
		lightAudioHandler()
		isLightOn = !isLightOn
		visible = isLightOn
		for area in self.get_overlapping_areas():
			if area.is_in_group("Monster") && isLightOn:
				area.spotted()
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
	Global.makeSubtitle($chargingSound,1,"Flashlight Charging")
	var currentBattery = $BatteryTimer.get_time_left()
	$BatteryTimer.set_paused(true)
	pauseBattery = true
	visible = false
	isLightOn = false
	charging = true
	$chargeTimer.start(chargeTimeLength)
	await $chargeTimer.timeout
	charging = false
	$BatteryTimer.start(min(currentBattery + chargeAmount,100))
	pauseBattery = false


#Shuts down flashlight when jump scare occurs
#OPTIMIZE FOR ANY MONSTER!!!!

	
	


func _on_gnome_game_over():
	visible = false
	pauseBattery = true
	isLightOn = false
	print("flashlight off!")


func _on_eyes_in_the_dark_game_over():
	visible = false
	pauseBattery = true
	isLightOn = false
	print("flashlight off!")


func _on_outlet_area_charge():
	if !pauseBattery:
		chargeHandler()
