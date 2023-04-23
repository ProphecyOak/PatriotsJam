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

var timeTillWin = 20
var won = false

var subtitleContainer: VBoxContainer = null
@onready var packedSubtitle = load("res://Components/subtitleLabel.tscn")

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

func makeSubtitle(player, type=0, text="", length=3.0): #0 for instant, 1 for not
	var newSubtitle = packedSubtitle.instantiate()
	subtitleContainer.add_child(newSubtitle)
	newSubtitle.attachPlayer(player, type, text, length)
