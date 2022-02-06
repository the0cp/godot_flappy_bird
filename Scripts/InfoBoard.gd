extends TextureRect

func _ready():
	add_to_group("GAME_STATE")
	set_process(false)
	
func _process(delta):
	if Input.is_action_just_pressed("ui_select"):
		get_tree().call_group("GAME_STATE", "on_game_start")

func on_game_over():
	$CurrentScore.text = str(GameData.score)
	$Record.text = str(GameData.load_record())
	$"/root/AudioManager".play("die")
	$AnimationPlayer.play("show")

func on_board_shown():
	set_process(true)
