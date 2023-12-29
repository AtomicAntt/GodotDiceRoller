extends Node2D

@export var offsetY: int = -13
@export var offsetX: int = -14

func _physics_process(delta):
	$DiceLabel.global_position = $Dice.global_position
	$DiceLabel.global_position.y += offsetY
	$DiceLabel.global_position.x += offsetX

func setRandomRange(range: int) -> void:
	$Dice.randomRange = range

func setImage(path: String) -> void:
	$Dice/Sprite2D.set_texture(load(path))
