extends Timer

var pipe_scn = preload("res://Objects/Pipe.tscn")

func _ready():
	add_to_group("GAME_STATE")
	connect("timeout", self, "on_timeout")

func on_timeout():
	var pipe = pipe_scn.instance()
	add_child(pipe)

func on_game_over():
	paused = true
