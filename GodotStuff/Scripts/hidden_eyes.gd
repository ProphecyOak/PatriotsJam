extends Node2D

const isEyes = true
const spotThreshold = 3
var spotCount = 0
var inLight = false

func BlinkCheck():
	if randi_range(0,10) > 6:
		$RoundEyes.play("Blink")

func spotted():
	spotCount += 1
	$SpotTimer.start()
	visible = false
	if spotCount >= spotThreshold:
		queue_free()


func spottedCheck():
	if !inLight:
		visible = true
	else:
		$SpotTimer.start()
