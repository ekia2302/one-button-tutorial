extends Node2D
signal game_over
@onready var balloon: CharacterBody2D = $Balloon

func _on_ground_game_over() -> void:
	game_over.emit()

func end_game():
	balloon.end_game()
