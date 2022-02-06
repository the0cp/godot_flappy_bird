extends Tween

var camera : Camera2D
var strength : float = 30
var duration : float = 1.0

func _ready():
	add_to_group("GAME_STATE")
	camera = get_parent() as Camera2D
	
func disturb_offset(s : float):
	camera.position.x = rand_range(-s,s)
	camera.position.y = rand_range(-s,s)

func on_game_over():
	interpolate_method(self,"disturb_offset",strength,0,duration,Tween.TRANS_SINE,Tween.EASE_OUT,0)
	start()
