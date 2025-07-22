extends Node2D

#load meteor scene
var meteor_scene : PackedScene = load("res://Scenes/meteor.tscn")
var laser_scene : PackedScene = load("res://Scenes/laser.tscn")

var health: int = 5

func _ready() -> void:
	#set up health ui
	get_tree().call_group("ui", "set_health", health)
	
	#stars animation
	var size := get_viewport().get_visible_rect().size
	var rng := RandomNumberGenerator.new()
	for star in $Stars.get_children(): 
		#position
		var random_x = rng.randf_range(0, size.x)
		var random_y = rng.randf_range(0, size.y)
		star.position = Vector2(random_x, random_y)
		
		#scale
		var random_scale = rng.randf_range(.25, 1)
		star.scale = Vector2(random_scale, random_scale)
		
		#animation speed
		star.speed_scale = rng.randf_range(0.6, 1.4)

func _on_meteor_timer_timeout() -> void:
	#create instance of meteor
	var meteor = meteor_scene.instantiate()
	
	#attach the node to the scene tree
	$Meteors.add_child(meteor)

	#connect the signal
	meteor.connect("collision", _on_meteor_collision)
	
func _on_meteor_collision():
	health -= 1
	get_tree().call_group("ui", "set_health", health)
	if health <= 0:
		get_tree().change_scene_to_file("res://Scenes/game_over.tscn")

func _on_player_laser(pos) -> void:
	var laser = laser_scene.instantiate()
	$Lasers.add_child(laser)
	laser.position = pos
