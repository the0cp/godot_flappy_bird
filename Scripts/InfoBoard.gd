extends TextureRect

var medal_gold = "res://assets/sprites/medals_gold.png"
var medal_silver = "res://assets/sprites/medals_silver.png"
var medal_copper = "res://assets/sprites/medals_copper.png"

var medal = Image.new()
var img_tex = ImageTexture.new()

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
		var err = medal.load(medal_copper)
		if err == 0:
			img_tex.create_from_image(medal)
			$Medal.texture = img_tex

	if GameData.score >= 10 && GameData.score < 20:
		var err = medal.load(medal_silver)
		if err == 0:
			img_tex.create_from_image(medal)
			$Medal.texture = img_tex

	if GameData.score >= 20:
		var err = medal.load(medal_gold)
		if err == 0:
			img_tex.create_from_image(medal)
			$Medal.texture = img_tex

func on_board_shown():
	set_process(true)
