extends Node2D
signal game_over
@onready var balloon = $Balloon

func end_game():
	balloon.end_game()

func _on_ground_body_entered(body):
	game_over.emit()
