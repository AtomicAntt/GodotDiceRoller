extends RigidBody2D

var rng = RandomNumberGenerator.new()
var value: int = -9999
@export var randomRange: int = 4

@onready var label = $"../DiceLabel"
@onready var world = get_tree().get_nodes_in_group("world")[0]

func _on_body_entered(body):
	if linear_velocity.length() >= 25:
		rng.randomize()
		var previousValue: int = value
		# Purpose: Make it so its always a different number
		while value == previousValue:
			value = rng.randi_range(1, randomRange)
		label.text = str(value) + "/" + str(randomRange)
	#	print("bounce: " + str(physics_material_override.bounce))
	#	physics_material_override.bounce /= 1.1
		linear_velocity /= 1.5
		world.updateTotal()

func _ready():
	applyRandomForce()
	value = rng.randi_range(1, randomRange)
	label.text = str(value) + "/" + str(randomRange)

func applyRandomForce():
	rng.randomize()
	# Generate a random angle in radians
	var random_angleX = rng.randi_range(-360, 360)
	var random_angleY = rng.randi_range(-360, 360)
	

	# Convert the angle to a Vector2 direction
	var force_direction = Vector2(random_angleX, random_angleY)
#	print(force_direction)

	# Set the magnitude of the force (adjust this value according to your needs)
	var force_magnitude = 5

	# Apply the force to the RigidBody2D
	apply_central_impulse(force_direction * force_magnitude)
