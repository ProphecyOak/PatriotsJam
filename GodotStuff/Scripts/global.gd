extends Node

var isAudioOn = true
var isJumpScaresOn = true

func toggleSounds():
	isAudioOn = !isAudioOn
	print("Sounds on: "+str(isAudioOn))
	
func toggleJumpScares():
	isJumpScaresOn = !isJumpScaresOn
	print("Jump Scares on: "+str(isJumpScaresOn))
