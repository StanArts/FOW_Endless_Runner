extends KinematicBody2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
const gravity = 1500
const jumpForce = -250
var velocity = Vector2.ZERO
# Called when the node enters the scene tree for the first time.
func _ready():

	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	velocity.y += gravity * delta
	if is_on_floor() && Input.is_action_just_pressed("jump"):
		velocity.y = jumpForce
	velocity = move_and_slide(velocity, Vector2.UP)
	$Sprite.rotation_degrees = velocity.y / 10
#	pass
