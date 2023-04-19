extends Node

var isAudioOn = true
var isJumpScaresOn = true
var gameOver = false;

var cribToggleKey = 32 #Spacebar
var chargeKey = 67 #c

var timeTillWin = 500
var won = false

func toggleSounds():
	isAudioOn = !isAudioOn
	print("Sounds on: "+str(isAudioOn))

func toggleJumpScares():
	isJumpScaresOn = !isJumpScaresOn
	print("Jump Scares on: "+str(isJumpScaresOn))
