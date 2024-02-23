extends CharacterBody2D

var speed: int = 100

func _process(_delta):
	get_input()

func get_input():
	var input_direction = Input.get_vector("left", "right", "up", "down")
	
	velocity = input_direction * speed
	
	move_and_slide()
