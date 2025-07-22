extends Node2D

#load meteor scene
var meteor_scene : PackedScene = load("res://Scenes/meteor.tscn")
var laser_scene : PackedScene = load("res://Scenes/laser.tscn")

func _on_meteor_timer_timeout() -> void:
	#create instance of meteor
	var meteor = meteor_scene.instantiate()
	
	#attach the node to the scene tree
	$Meteors.add_child(meteor)


func _on_player_laser(pos) -> void:
	var laser = laser_scene.instantiate()
	$Lasers.add_child(laser)
	laser.position = pos
