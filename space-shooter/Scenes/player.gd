extends CharacterBody2D
class_name PlayerShip;

@export var speed := 1.0;
@export var turnSpeed := 1.0;
var can_shoot : bool = true

signal laser(pos)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	position += Vector2(100,500) 

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	var direction = Input.get_vector("TurnLeft", "TurnRight", "MoveForward", "MoveBackward")
	velocity = direction * speed
	move_and_slide()
	
	#Shooting mechanic
	if Input.is_action_just_pressed("Shoot") and can_shoot :
		laser.emit($LaserStartPos.global_position)
		can_shoot = false
		$LaserTimer.start()


func _on_laser_timer_timeout() -> void:
	can_shoot = true
