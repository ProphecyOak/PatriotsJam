extends  Monster

var place: String = "Resting"
const places: Array[String] = ["TopLeft","TopRight","BottomLeft","BottomRight"]

func _ready():
	globalRegister()
	$SpotTimer.start(rndTime(Time_Until_Reappear))

func showLamia(isWatching):
	$Crib.visible = isWatching
	$Room.visible = !isWatching

func changeCorner():
	if !isEvil:
		if place != "Gone":
			get_node("Crib/"+place).visible = false
			get_node("Room/"+place).visible = false
		if place == "Resting":
			if randf() > .3:
				place = places[randi_range(0,3)]
				$EvilTimer.start(rndTime(Time_Until_Evil))
			else:
				place = "Gone"
				$SpotTimer.start(rndTime(Time_Until_Reappear))
				return
		else:
			place = "Resting"
			$SpotTimer.start(rndTime(Time_Until_Reappear))
		get_node("Crib/"+place).visible = true
		get_node("Room/"+place).visible = true

func onSpotted():
	pass
func onUnspotted():
	pass

func checkJumpScare():
	print(isEvil)
	if isEvil:
		super.doEvil()

func doEvil():
	isEvil = false
	if $"../Child".location == place:
		get_node("Crib/"+place).visible = false
		get_node("Room/"+place).visible = false
		isEvil = true
	else:
		changeCorner()

