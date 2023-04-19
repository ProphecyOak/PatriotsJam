extends Node2D

func _ready():
	if Global.won:
		$WinScreen.visible = true
