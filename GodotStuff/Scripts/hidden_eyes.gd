extends Node2D
class_name HiddenEyes

const isEyes = true
const spotThreshold = 3
var spotCount = 0
var inLight = false
var isEvil = false

func BlinkCheck():
	if randi_range(0,10) > 6:
		$RoundEyes.play("Blink")

func spotted():
	if !isEvil:
		spotCount += 1
		$SpotTimer.start()
		$EvilTimer.stop()
		visible = false
		if spotCount >= spotThreshold:
			queue_free()

func spottedCheck():
	if !inLight:
		visible = true
		if isEvil:
			$Smile.play("Open")
		$EvilTimer.start()
	else:
		$SpotTimer.start()


func evilCheck():
	isEvil = true
	if !inLight:
		$Smile.play("Open")
