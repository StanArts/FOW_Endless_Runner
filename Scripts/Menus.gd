extends CanvasLayer

signal start_game

onready var start_message = $StartMenu/StartMessage
onready var tween = $Tween
onready var score_label = $GameOver/ScoreLabel
onready var high_score_label = $GameOver/HighScoreLabel

var game_started = false

func _input(event):
	if event.is_action("jump") && !game_started:
		emit_signal("start_game")
		tween.interpolate_property(start_message, "modulate:a", 1, 0, 0.5,Tween.TRANS_LINEAR, Tween.EASE_IN)
	
		tween.start()
		game_started = true
		

func init_game_over_menu(score):
	score_label.text = "SCORE: " + str(score)
	high_score_label.text = "Best: " + str(Globals.high_score)
	
func _on_Button_button_down():
	get_tree().reload_current_scene()
	pass # Replace with function body.