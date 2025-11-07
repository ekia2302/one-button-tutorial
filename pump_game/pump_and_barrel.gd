extends Node2D
signal game_over

@onready var pump = $Pump
@onready var barrel = $Barrel
@onready var fill_level = $Fill
var playing = true

func _process(delta):
	if not playing:
		return
	
	if Input.is_action_just_pressed("action"):
		pump.play("pump")
		fill_level.value += 10
	else:
		pump.play("default")
		fill_level.value -= 0.1
	
	if fill_level.value <= 0:
		playing = false
		game_over.emit()
		barrel.play("empty")

func end_game() -> void:
	playing = false
