extends Node2D

var total: int = 0

@onready var totalLabel: Label = $CanvasLayer/VBoxContainer/TotalLabel
@onready var spawnPosition: Marker2D = $SpawnPosition

@onready var diceNode := preload("res://GameObjects/dice_node.tscn")

func updateTotal() -> void:
	total = 0
	for dice in get_tree().get_nodes_in_group("dice"):
		total += dice.value
	
	totalLabel.text = "Total: " + str(total)

func createDice(value: int, imagePath: String) -> void:
	var diceInstance := diceNode.instantiate()
	diceInstance.global_position = spawnPosition.position
	diceInstance.setRandomRange(value)
	diceInstance.setImage(imagePath)
	add_child(diceInstance)

func _on_roll_d_4_pressed():
	createDice(4, "res://GameAssets/RedDice.png")

func _on_roll_d_6_pressed():
	createDice(6, "res://GameAssets/GreenDice.png")

func _on_roll_d_8_pressed():
	createDice(8, "res://GameAssets/YellowDice.png")

func _on_roll_d_10_pressed():
	createDice(10, "res://GameAssets/PurpleDice.png")

func _on_roll_d_12_pressed():
	createDice(12, "res://GameAssets/PinkDice.png")

func _on_roll_d_20_pressed():
	createDice(20, "res://GameAssets/BlueDice.png")

func _on_reset_pressed():
	for diceNode in get_tree().get_nodes_in_group("dicenode"):
		diceNode.queue_free()
		total = 0
		totalLabel.text = "Total: " + str(total)
