extends Node2D
signal game_over
@onready var pump_and_barrel = $PumpAndBarrel

func _on_pump_and_barrel_game_over():
	game_over.emit()

func end_game():
	pump_and_barrel.end_game()
