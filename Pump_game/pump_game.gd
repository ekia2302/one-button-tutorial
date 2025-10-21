extends Node2D
signal game_over
@onready var pump_and_barrel: Node2D = $Pump_and_barrel

func _on_pump_and_barrel_game_over() -> void:
	game_over.emit()

func end_game():
	pump_and_barrel.end_game()
