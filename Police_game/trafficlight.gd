extends Node2D
signal game_over

@onready var timer: Timer = $Timer
@onready var rng = RandomNumberGenerator.new()
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var was_red = false
var playing = true

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if not playing:
		return
	
	if Input.is_action_just_pressed("action") and animated_sprite_2d.animation == "red":
		game_over.emit()


func _on_timer_timeout() -> void:
	if not playing:
		return
	
	var new_time = rng.randi_range(2,4)
	if animated_sprite_2d.animation == "green":
		animated_sprite_2d.play("yellow")
		was_red = false
	elif animated_sprite_2d.animation == "red":
		animated_sprite_2d.play("yellow")
		was_red = true
	elif animated_sprite_2d.animation == "yellow" and was_red:
		animated_sprite_2d.play("green")
	else:
		animated_sprite_2d.play("red")
	
	timer.start(new_time)

func end_game():
	playing = false
