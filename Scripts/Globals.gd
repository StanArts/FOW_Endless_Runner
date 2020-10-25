extends Node

var high_score = 0

var score_file = "user://score.save"

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
