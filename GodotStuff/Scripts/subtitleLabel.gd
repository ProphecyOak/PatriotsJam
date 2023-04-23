extends Label

var player = null
var noiseType: int = 0

func _process(_delta):
	if noiseType == 1:
		if !player.playing:
			destroy()

func attachPlayer(node, type, description, length):
	player = node
	noiseType = type
	text = "["+description+"]"
	if noiseType == 0:
		await get_tree().create_timer(length).timeout
		destroy()

func destroy():
	queue_free()
