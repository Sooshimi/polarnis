extends CharacterBody2D

var speed: int = 100
var input_direction: Vector2

@onready var animation_tree: AnimationTree = $AnimationTree

func _process(_delta):
	get_input()
	play_animations()

func get_input():
	input_direction = Input.get_vector("left", "right", "up", "down")
	
	velocity = input_direction * speed
	
	move_and_slide()

func play_animations():
	if input_direction == Vector2.ZERO:
		animation_tree.get("parameters/playback").travel("idle")
	else:
		animation_tree.get("parameters/playback").travel("walk")
		animation_tree.set("parameters/idle/blend_position", input_direction)
		animation_tree.set("parameters/walk/blend_position", input_direction)
