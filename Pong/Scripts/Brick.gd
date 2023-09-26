extends CharacterBody2D

@export var speed = 800
@export var player = 0
var inputs = ["ui_left", "ui_right"]
var screen_size = 0

func _init():
	if player != 0:
		inputs = ["key_left", "key_right"]
		
func _ready():
	screen_size = get_viewport().get_visible_rect().size
		
func _process(delta):
	if Input.is_action_pressed(inputs[0]) and position.x > 0:
		position.x -= delta * speed
	if Input.is_action_pressed(inputs[1]) and position.x < screen_size.y:
		position.x += delta * speed
