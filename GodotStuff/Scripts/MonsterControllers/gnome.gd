extends  Monster

var spottedLately = false

#toggles zoom for camera2D
signal zoomCamera

func _ready():
	$SpotTimer.start(randi_range(4,10))

#Spotted behavior. Default just hides monster if not evil
#onSpotted(): void
func onSpotted():
	if !spottedLately:
		spottedLately = true
		print("You Found ME")
		await get_tree().create_timer(1).timeout
		super()

#Unspotted behavior. Restarts evil timer. Default just shows monster
#onUnspotted(): void
func onUnspotted():
	super()


#Evil behavior
#doEvil(): void
func doEvil():
	position = Vector2(600, 200)
	$Default.visible = false;
	super()


func spotTimerDone():
	visible = true
	spottedLately = false
	position = Vector2(randi_range(225,800), randi_range(500,600))
	print ("spawned at " + str(position))
	if !inLight:
		onUnspotted()
