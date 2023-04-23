extends  Monster

var currentPosition = -1

@export var moveSpeed: int = 20
@export_group("States")
@export var flyingLast: int
@export var standingLast: int
@export var locations: Array[Vector2] = []
var numPos = len(locations)
@export var scales: Array[float] = []
@export var soundLevels: Array[float] = [-100,-15,5,15,25,-100]

var gonnaMoveBack: bool = false

func _ready():
	$MoveTimer.wait_time = moveSpeed

func moveTimerDone(direction = 1):
	currentPosition += direction
	currentPosition = max(-1,currentPosition)
	visible = currentPosition >= 0
	if currentPosition > -1 && currentPosition <= flyingLast:
		$SnipeFlying.visible = true
		$SnipeStanding.visible = false
	elif currentPosition <= standingLast:
		$SnipeFlying.visible = false
		$SnipeStanding.visible = true
	elif currentPosition > numPos - 1:
		doEvil()
		return
	if direction > 0:
		$Screech.volume_db = soundLevels[currentPosition]
		$Screech.play()
	position = locations[currentPosition]
	scale = Vector2(scales[currentPosition],scales[currentPosition])
	$SpotTimer.start(2)

#Spotted behavior. Default just hides monster if not evil
#onSpotted(): void
func onSpotted():
	if visible && $SpotTimer.is_stopped():
		if randi_range(1,4)<=2:
			gonnaMoveBack = true
		$SpotTimer.start(rndTime(Time_Until_Reappear))
		$MoveTimer.set_paused(true)

#Prevents Spot Timer from being continuously triggered
#unspotted(): void
func unspotted():
	pass

#Unspotted behavior. Restarts evil timer. Default just shows monster
#onUnspotted(): void
func onUnspotted():
	$MoveTimer.set_paused(false)
	if gonnaMoveBack:
		moveTimerDone(-1)
		gonnaMoveBack = false

#Evil behavior
#doEvil(): void
func doEvil():
	get_parent().clip_children = 0
	position = Vector2(570, 330)
	$SnipeFlying.visible = false;
	super()

