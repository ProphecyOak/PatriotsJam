extends Node2D

func showCrib(isWatching):
	$Crib.visible = isWatching
	$Child.visible = isWatching
	$Lamia.showLamia(isWatching)
