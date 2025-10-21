extends Node2D
signal game_over

@onready var difftimer: Timer = $"Difficulty"
@onready var pump: AnimatedSprite2D = $Pump
@onready var barrel: AnimatedSprite2D = $Barrel
@onready var fill: TextureProgressBar = $Fill
var difficulty = 1
var playing = true

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if not playing:
		return
	
	if Input.is_action_just_pressed("action"):
		pump.play("pump")
		fill.value += 10/difficulty
	else:
		pump.play("default")
		fill.value -= 0.1
	
	if fill.value <= 0:
		playing = false
		game_over.emit()
		barrel.play("empty")

func _on_difficulty_timeout() -> void:
	difficulty += 0.25
	difftimer.start(5)


func end_game() -> void:
	playing = false
