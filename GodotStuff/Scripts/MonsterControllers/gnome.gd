extends  Monster

func _ready():
	$SpotTimer.start(randi_range(4,10))

#Spotted behavior. Default just hides monster if not evil
#onSpotted(): void
func onSpotted():
	print ("spotted!")
	await get_tree().create_timer(1).timeout
	super()

#Unspotted behavior. Restarts evil timer. Default just shows monster
#onUnspotted(): void
func onUnspotted():
	super()


#Evil behavior
#doEvil(): void
func doEvil():
	super()


func spotTimerDone():
	visible = true;
	position = Vector2(randi_range(225,800), randi_range(500,600));
	print ("spawned at " + str(position))
	if !inLight:
		onUnspotted()


func evilTimerDone():
	print("EVIL HAHAHAHAHAHAH")
	isEvil = true
	doEvil()
