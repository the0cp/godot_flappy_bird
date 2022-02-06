extends Node

var game_tscn = preload("res://Game.tscn")

func _ready():
	add_to_group("GAME_STATE")
	get_tree().call_group("GAME_STATE", "on_game_start")
	
func on_game_start():
	var game = get_node_or_null("Game")
	if game != null:
		remove_child(game)
		game.queue_free()
	
	game = game_tscn.instance()
	add_child(game)
