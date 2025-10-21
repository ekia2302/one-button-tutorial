extends AnimatedSprite2D

@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var rng = RandomNumberGenerator.new()
var wait = false
var playing = true

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if not playing:
		return
	
	if Input.is_action_just_pressed("action") and not wait:
		animation_player.play("drive_out")
		wait = true


func _rand_color():
	var number = rng.randi_range(0,1)
	if number == 0:
		play("green")
	else:
		play("red")


func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	if anim_name == "drive_out":
		wait = false
		animation_player.play("drive_in")

func _on_trafficlight_game_over() -> void:
	animation_player.play("game_over")

func end_game():
	playing = false
