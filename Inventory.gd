extends Node

var coins: int = 0
var items := {
	"apple": 1
}


func has_item(item: String) -> bool:
	return items.has(item) and items[item] > 0

func add_item(item: String, amount: int = 1) -> void:
	items[item] = items.get(item, 0) + amount
	print("Inventory:", items)

func remove_item(item: String, amount: int = 1) -> void:
	if has_item(item):
		items[item] -= amount
		print(" Removed:", item, "Now:", items[item])

func add_coins(amount: int) -> void:
	coins += amount
	print(" Coins:", coins)
