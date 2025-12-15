extends Node

signal coinAmount(amount)
signal timeCounter(timeLeft)
signal gameOver

var coins: int = 0: 
	set(value): 
		coins = value
		emit_signal("coinAmount", coins)
		
	
var time: float = 15 * 60: 
	set(value): 
		time = value
		emit_signal("timeCounter", time)
		if time <= 0: 
			emit_signal("gameOver")
		
	
var paused: bool = false
