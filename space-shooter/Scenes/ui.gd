extends CanvasLayer

static var image = load("res://PNG/UI/playerLife1_red.png")
var time_elapsed : int = 0

func set_health(amount):
	#remove all children 
	for child in $MarginContainer2/HBoxContainer.get_children():
		child.queue_free()
	
	#create new children and amount is set by health
	for i in amount:
		var text_rect = TextureRect.new()
		text_rect.texture = image
		$MarginContainer2/HBoxContainer.add_child(text_rect)
		text_rect.stretch_mode = TextureRect.STRETCH_KEEP


func _on_score_timer_timeout() -> void:
	time_elapsed += 1
	$MarginContainer/Label.text = str(time_elapsed)
	Global.score = time_elapsed
