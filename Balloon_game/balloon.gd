extends CharacterBody2D

var playing = true
@onready var animated_sprite_2d = $AnimatedSprite2D

func _physics_process(delta):
	if not playing:
		return
	if Input.is_action_pressed("action"):
		animated_sprite_2d.play("inflate")
		velocity.y -= 0.5
	else:
		animated_sprite_2d.play("deflate")
		velocity.y += 0.5
	move_and_slide()

func _on_ground_body_entered(body):
	playing = false
	animated_sprite_2d.play("dead")

func end_game():
	playing = false 
