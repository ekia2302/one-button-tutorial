extends Node2D
signal game_over
@onready var police: AnimatedSprite2D = $Police
@onready var cars: AnimatedSprite2D = $Cars
@onready var trafficlight: Node2D = $Trafficlight

func stop_game():
	game_over.emit()

func end_game():
	police.end_game()
	cars.end_game()
	trafficlight.end_game()
	
