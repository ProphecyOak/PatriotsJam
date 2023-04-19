extends  Monster

var place: String = "Resting"
const places: Array[String] = ["TopLeft","TopRight","BottomLeft","BottomRight"]

func _ready():
	$SpotTimer.start(rndTime(Time_Until_Reappear))

func showLamia(isWatching):
	$Crib.visible = isWatching
	$Room.visible = !isWatching

func changeCorner(dir=1):
	get_node("Crib/"+place).visible = false
	get_node("Room/"+place).visible = false
	if dir:
		place = places[randi_range(0,3)]
		$EvilTimer.start(rndTime(Time_Until_Evil))
	else:
		place = "Resting"
		$SpotTimer.start(rndTime(Time_Until_Reappear))
	get_node("Crib/"+place).visible = true
	get_node("Room/"+place).visible = true

func onSpotted():
	pass
func onUnspotted():
	pass
func doEvil():
	if $"../Child".location == place:
		super()
	else:
		changeCorner(0)

