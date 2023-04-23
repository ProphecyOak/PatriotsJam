extends Node2D

func _ready():
	if Global.won:
		$WinScreen.visible = true
	else:
		$LoseScreen/Label.text = "YOU LOST TO THE\n"+Global.monsterLostTo
