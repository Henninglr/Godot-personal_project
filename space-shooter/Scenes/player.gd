extends Node2D
class_name PlayerShip;

@export var speed := 1.0;
@export var turnSpeed := 1.0;

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	position += Vector2(100,500) 

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var direction = Input.get_vector("TurnLeft", "TurnRight", "MoveForward", "MoveBackward")
	position += direction * speed * delta
