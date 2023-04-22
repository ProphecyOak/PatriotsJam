extends Node

var isAudioOn = true
var isJumpScaresOn = true
var gameOver = false
var monsterLostTo = ""
var isWatchingCrib = false
var mainCam = null
var flashlight = null
var monsters = []

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
	if !gameOver:
		gameOver = true
		monsterLostTo = monster
		for m in monsters:
			if m.name != monsterLostTo:
				m.visible = false
		mainCam.zoom += Vector2(1,1)
	
func toggleGameNotOver():
	if gameOver:
		gameOver = false
		monsterLostTo = ""
		mainCam.zoom -= Vector2(1,1)
