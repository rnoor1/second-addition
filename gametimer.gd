extends Node

class_name GameTimer 

func _process(delta): 
	if Globalcounter.paused: 
		return
	if Globalcounter.time > 0: 
		Globalcounter.time -= delta 
		
