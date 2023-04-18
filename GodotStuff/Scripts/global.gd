extends Node

var isAudioOn = true
var isJumpScaresOn = true

var cribToggleKey = 32 #Spacebar
var debugKey = 67 #c

func toggleSounds():
	isAudioOn = !isAudioOn
	print("Sounds on: "+str(isAudioOn))
	
func toggleJumpScares():
	isJumpScaresOn = !isJumpScaresOn
	print("Jump Scares on: "+str(isJumpScaresOn))
