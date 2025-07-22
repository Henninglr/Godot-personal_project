extends Area2D

var speed : float
var rotaion_speed : float
var direction_x : float

signal collision

func _ready() :
	var rng := RandomNumberGenerator.new()
	
	#random texture
	var meteor_array = [
		"meteorBrown_big1", "meteorBrown_big2", "meteorBrown_big3", 
		"meteorGrey_big1", "meteorGrey_big2", "meteorGrey_big3"
		]
	var path : String = "res://PNG/Meteors/" + meteor_array.pick_random() + ".png"
	$Sprite2D.texture = load(path)
	
	#start position
	var width = get_viewport().get_visible_rect().size[0]
	var random_x = rng.randi_range(0, width)
	var random_y = rng.randi_range(-150, -50)
	position = Vector2(random_x, random_y)
	
	#speed / rotation / direction
	speed = rng.randi_range(200, 500)
	direction_x = rng.randi_range(-1, 1)
	rotaion_speed = rng.randi_range(40, 100)
	
func _process(delta: float) -> void:
	position += Vector2(0, 1.0) * speed * delta
	rotation_degrees += rotaion_speed * delta
	
func _on_body_entered(_body: Node2D) -> void:
	collision.emit()


func _on_area_entered(area: Area2D) -> void:
	area.queue_free()
	queue_free()
