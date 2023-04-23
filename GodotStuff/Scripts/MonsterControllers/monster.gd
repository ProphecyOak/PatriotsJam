extends Area2D
class_name Monster

#Exports timer lengths
@export var Time_Until_Evil: int = 15
@export var Time_Until_Reappear: int = 5

#initializes lit and evil qualities
var inLight: bool = false
var isEvil: bool = false


#Generates random Time based within delta% of value either way
#rndTime(timeBase: int, delta: int): float
func rndTime(timeBase: int, delta: int = 20):
	return timeBase * (1 + randi_range(-delta, delta)/100.0)

func _ready():
	$EvilTimer.start(rndTime(Time_Until_Evil))

func globalRegister():
	Global.monsters.append(self)

#Stops evil timer progress, and triggers spotted behavior
#spotted(): void
func spotted():
	$EvilTimer.stop()
	onSpotted()

#Spotted behavior. Default just hides monster if not evil
#onSpotted(): void
func onSpotted():
	if !isEvil:
		visible = false

#If out of flashlight, begins countdown till unspotted behavior
#unspotted(): void
func unspotted():
	if Time_Until_Reappear > 0:
		$SpotTimer.start(rndTime(Time_Until_Reappear))
	else:
		spotTimerDone()

#If still out of the light, triggers unspotted behavior
#spotTimerDone(): void
func spotTimerDone():
	if !inLight:
		onUnspotted()

#Unspotted behavior. Restarts evil timer. Default just shows monster
#onUnspotted(): void
func onUnspotted():
	visible = true
	if !isEvil:
		$EvilTimer.start(rndTime(Time_Until_Evil))

#Modifies isEvil and triggers evil behavior
#evilTimerDone(): void
func evilTimerDone():
	isEvil = true
	doEvil()

#Evil behavior
#doEvil(): void
func doEvil():
	await Global.toggleGameOver(name)
	await jumpScare()
	await get_tree().create_timer(2).timeout
	get_tree().change_scene_to_file("res://Scenes/endScreen.tscn")

func jumpScare(anim="jumpScare"):
	if Global.monsterLostTo == name:
		Global.flashlight._on_battery_timer_timeout()
		if Global.isJumpScaresOn:
			$Scare.visible = true
			$Scare.play(anim)
			$scareSound.play()
			#await get_tree().create_timer(1).timeout
