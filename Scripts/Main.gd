extends Node2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var health = 3
var obstacle_scenes = [preload("res://Scenes/Cat.tscn"), preload("res://Scenes/Bat.tscn"), preload("res://Scenes/Bonbon.tscn")]
var tree_scene = preload("res://Scenes/Tree.tscn")

onready var hud = $HUD

var score := 0 setget set_score

func new_game():
	self.score = 0
	$Timer.start()
	#$HUD.visible = true
	
func set_score(new_score):
	score = new_score
	hud.update_score(score)
	if score > Globals.high_score:
		Globals.high_score = score
		Globals.save_score()
		
func player_score():
	self.score += 1
# Called when the node enters the scene tree for the first time.

func _ready():
	Globals.load_score()
	hud.update_score(Globals.high_score)
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	Engine.time_scale = (0.5 + score/10.0)
	for o in  get_tree().get_nodes_in_group("obstacles") + get_tree().get_nodes_in_group("collectables") + get_tree().get_nodes_in_group("decorations"):
		o.move_and_slide(Vector2.LEFT * 200)
	pass

func _on_Timer_timeout():
	
	var i = obstacle_scenes[randi()%obstacle_scenes.size()].instance()
	add_child(i)
	i.position = Vector2(270, 122)
	pass # Replace with function body.

func _on_Tree_Spawner_timeout():
	
	var i = tree_scene.instance()
	add_child(i)
	i.position = Vector2(270, 122)
	pass # Replace with function body.

func _on_Area2D_area_entered(area:Area2D):
	if area.get_parent().is_in_group("obstacles"):
		health -= 1
		$Player/AnimationPlayer.play("life_lost")
		print (health)
		if health <= 0:
			$Player/AnimationPlayer.play("dead")
	elif area.get_parent().is_in_group("collectables"):
		var bonbon = area.get_parent()
		bonbon.get_node("Sprite/AnimationPlayer").play("collect")
		player_score()
		print(score)
	pass # Replace with function body.

func die():
	print("show game over")
	$MenuLayer/GameOver.visible = true
	
func _on_Button_button_down():
	get_tree().reload_current_scene()
	$MenuLaye
	pass # Replace with function body.

func _on_MenuLayer_start_game():
	new_game()
	pass # Replace with function body.

