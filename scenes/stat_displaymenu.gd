extends VBoxContainer

@onready var coin_display: Label = $coinDisplay
@onready var time_display: Label = $timeDisplay

# Called when the node enters the scene tree for the first time.
func _ready():
	# connects global signals 
	Globalcounter.coinAmount.connect(update_coins)
	Globalcounter.timeCounter.connect(update_time)
	
	update_coins(Globalcounter.coins)
	
func update_coins(amount: int) -> void: 
	coin_display.text = "COINS: %d" % amount

func update_time(seconds: float) -> void:
	var minutes = int(seconds)/60
	var secs = int(seconds)%60
	time_display.text = "TIME: %02D:%02d" % [minutes, secs]
