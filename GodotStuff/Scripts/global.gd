extends Node

var isAudioOn = true
var isJumpScaresOn = true
var gameOver = false
var monsterLostTo = ""
var isWatchingCrib = false
var mainCam = null
var flashlight = null

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

func toggleGameOver(monster):
	gameOver = true
	monsterLostTo = monster
	mainCam.zoom += Vector2(1,1)
