extends CharacterBody2D

var FLY_VELOCITY = -30.0
var FALL_VELOCITY = 25
var playing = true
var difficulty = 1
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var diff_timer: Timer = $Difficulty

func _physics_process(delta: float) -> void:
	if not playing:
		return
	# Add the gravity.
	if not is_on_floor():
		velocity += Vector2.DOWN * FALL_VELOCITY * delta

	# Handle jump.
	if Input.is_action_pressed("action"):
		animated_sprite_2d.play("inflate")
		velocity.y = FLY_VELOCITY/difficulty
	else:
		animated_sprite_2d.play("deflate")

	move_and_slide()


func _on_ground_game_over() -> void:
	playing = false
	animated_sprite_2d.play("dead")


func _on_difficulty_timeout() -> void:
	diff_timer.start(5)
	difficulty += 0.25

func end_game():
	playing = false 
	
