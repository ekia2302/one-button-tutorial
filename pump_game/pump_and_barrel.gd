extends Node2D
signal game_over

@onready var pump = $Pump
@onready var barrel = $Barrel
@onready var fill_level = $Fill
var playing = true

func _process(delta):
	if not playing:
		return
	
	# TODO 
	# if 'action' input then play pump animation and increase value of fill_level
	# else play default animation for pump and decrease value of fill_level
	# if value of fill_level reaches zero then play the empty animtion for the barrel and end the game

func end_game() -> void:
	playing = false
