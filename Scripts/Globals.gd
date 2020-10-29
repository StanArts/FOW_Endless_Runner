extends Node

signal no_health
signal health_changed(value)

var high_score = 0

var score_file = "user://score.save"

export(int) var max_health = 3
onready var health = max_health setget set_health

func set_health(value):
	health = value
	emit_signal("health_changed", health)
	if health <= 0:
		emit_signal("no_health")

func save_score():
    var file = File.new()
    file.open(score_file, File.WRITE)
    file.store_var(high_score)
    file.close()
    print ("saved ", high_score)

func load_score():
    var file = File.new()
    if file.file_exists(score_file):
        file.open(score_file, File.READ)
        high_score = file.get_var()
        file.close()
        print("loaded ", high_score)
    else:
        print("failed to load")
        high_score = 0
