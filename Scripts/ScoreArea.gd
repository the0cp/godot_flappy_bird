extends Area2D

func _ready():
	add_to_group("GAME_STATE")
	connect("body_exited", self, "on_body_exited")
	
func on_body_exited(_body):
	if _body.name == "Bird":
		AudioManager.play("point")
		GameData.score += 1
		get_tree().call_group("SCORE","on_score_updated",GameData.score)
		print("scored!!")

func on_game_over():
	disconnect("body_exited", self, "on_body_exited")
