extends  Monster

#Spotted behavior. Default just hides monster if not evil
#onSpotted(): void
func onSpotted():
	if !isEvil:
		visible = false

#Unspotted behavior. Restarts evil timer. Default just shows monster
#onUnspotted(): void
func onUnspotted():
	visible = true
	if !isEvil:
		$EvilTimer.start(Time_Until_Evil)

#Evil behavior
#doEvil(): void
func doEvil():
	print("hahahah you lose because im evil now -"+name)
