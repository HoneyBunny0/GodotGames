extends CharacterBody2D

@export var speed = 800
@export var player = 0

func _process(delta):
	var inputs = ["ui_left", "ui_right"]
	if player != 0:
		inputs = ["key_left", "key_right"]
	
	if Input.is_action_pressed(inputs[0]):
		position.x -= delta * speed
	if Input.is_action_pressed(inputs[1]):
		position.x += delta * speed

	
