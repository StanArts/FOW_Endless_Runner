extends CanvasLayer

signal start_game

onready var start_message = $StartMenu/StartMessage
onready var tween = $Tween

var game_started = false

func _input(event):
	if event.is_action("jump") && !game_started:
		emit_signal("start_game")
		tween.interpolate_property(start_message, "modulate:a", 1, 0, 0.5,Tween.TRANS_LINEAR, Tween.EASE_IN)
	
		tween.start()
		game_started = true