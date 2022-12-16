extends Node
	
func _ready():
	GameData.score = 0
	var bg = [
		preload("res://assets/sprites/background-day.png"),
		preload("res://assets/sprites/background-night.png")
	]
	$Background.set_texture(bg[randi() % 2])
