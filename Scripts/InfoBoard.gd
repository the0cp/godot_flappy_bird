extends TextureRect

var medal_gold = "res://assets/sprites/medals_gold.png"
var medal_silver = "res://assets/sprites/medals_silver.png"
var medal_copper = "res://assets/sprites/medals_copper.png"

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

	if GameData.score >= 0 && GameData.score < 10:
		$Medal.texture = load(medal_copper)

	if GameData.score >= 10 && GameData.score < 20:
		$Medal.texture = load(medal_silver)

	if GameData.score >= 20:
		$Medal.texture = load(medal_gold)

func on_board_shown():
	set_process(true)
