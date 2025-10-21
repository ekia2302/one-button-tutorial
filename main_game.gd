extends Node2D

@onready var title: Label = $Title
@onready var info: Label = $Info
@onready var score: Label = $Score
@onready var timer: Timer = $Timer
@export_file_path var game_paths: Array[String]
@onready var games = []
var started = false
var game_no = 0
var score_time = 0
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for scene in game_paths:
		games.append(load(scene).instantiate())


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("action") and not started:
		started = true
		game_no += 1
		add_game(games[0], 140,510, game_no)
		title.text = "One Button to play one game"
		info.visible = false
		timer.start(5)
	if Input.is_action_just_pressed("restart") and started:
		get_tree().reload_current_scene()
	if Input.is_action_just_pressed("quit"):
		get_tree().quit()

func add_game(game, x, y, game_no):
	add_child(game)
	game.position = Vector2(x,y)
	game.scale = Vector2(1.5,1.5)
	game.game_over.connect(Callable(self,"_on_game"+str(game_no)+"_game_over"))

func game_over():
	if game_no < 3:
			_on_timer_timeout()
			_on_timer_timeout()
	info.position = Vector2(320, 500)
	info.text = "Game Over! Press the 'R' key to restart the game."
	timer.stop()
	for game in games:
		game.end_game()

func _on_game1_game_over() -> void:
	game_over()


func _on_game2_game_over() -> void:
	game_over()


func _on_game3_game_over() -> void:
	game_over()               


func _on_timer_timeout() -> void:
	if game_no == 1:
		title.text = "One Button to play two games"
		game_no +=1
		add_game(games[1], 1000, 510, game_no)
		timer.start(5)
	elif game_no == 2:  
		title.text = "One Button to play three games"
		game_no +=1
		add_game(games[2], 575, 320, game_no)
		timer.start(1)
		info.position = Vector2(400,500)
		info.visible = true
		info.text = "Try to hold on as long as possible!"
	else:
		score.text = "Score:"+str(score_time)
		score.visible = true 
		score_time+=1
		timer.start(1)
