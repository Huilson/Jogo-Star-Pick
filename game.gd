extends Node2D

var score = 0

@onready var score_label = $Score
@onready var game_over_ui = $GameOverUI
@onready var game_over_text = $GameOverUI/Control/CenterContainer/TextureRect/VBoxContainer/GameOverText

func _ready():
	
	randomize()

func add_score():
	print("Adicinando score...")
	score += 1
	score_label.text = "Score: " + str(score)

func game_over():
	print("Chamada da função Game Over")
	get_tree().paused = true #função interna para pausar o game
	game_over_ui.visible = true #por padrão deixamos esse canvas 
	#invisivel e só mostramos ele ao perder a partida
	game_over_text.text = "Game Over\nScore: " + str(score)
	#mostra o placar

func _on_restart_pressed():
	get_tree().paused = false
	get_tree().reload_current_scene()
