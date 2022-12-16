extends RigidBody2D

var bird_index

var bird_animation = [
		["fly-r", "die-r"],
		["fly-y", "die-y"],
		["fly-b", "die-b"]
	]
	
func _ready():
	connect("body_entered", self, "on_body_entered")
	bird_index = randi() % 3
	$AnimatedSprite.animation = bird_animation[bird_index][0]
	
func on_body_entered(_body):
	call_deferred("set_physics_process", false)
	call_deferred("set_contact_monitor", false)
	AudioManager.play("hit")
	$AnimatedSprite.play(bird_animation[bird_index][1])
	
	GameData.update_record()
	get_tree().call_group("GAME_STATE", "on_game_over")
	#print("Die...")
	

func _physics_process(delta):
	if Input.is_action_just_pressed("ui_select"):
		$"/root/AudioManager".play("swoosh")
		linear_velocity = Vector2.UP * 275
		angular_velocity = -3.0
	if rotation_degrees < -20:
		rotation_degrees = -20
		angular_velocity = 0
	if linear_velocity.y > 0.0:
		angular_velocity = 1.5
