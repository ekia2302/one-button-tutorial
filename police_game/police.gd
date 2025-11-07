extends AnimatedSprite2D

@onready var anim_cooldown: Timer = $AnimCooldown
@onready var cooldown_time = 0.4
var playing = true

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if not playing:
		return
	
	if Input.is_action_just_pressed("action"):
		play("whistle")
		anim_cooldown.start(cooldown_time)


func _on_anim_cooldown_timeout() -> void:
	play("default" )

func end_game():
	playing = false
