extends CharacterBody2D

@export var init_speed = 20
var speed = 0

func _init():
	speed = init_speed
	
func _ready():
	randomize()
	var rng = RandomNumberGenerator.new()
	set_velocity(Vector2(rng.randf_range(-1, 1), rng.randf()).normalized() * init_speed)
	
func _process(delta):
	var collision = move_and_collide(velocity * speed * delta)
	if collision:
		velocity = velocity.bounce(collision.get_normal())
		speed += init_speed / 10
		
	if not $VisibleOnScreenNotifier2D.is_on_screen():
		var screen_size = get_viewport().get_visible_rect().size
		if position.y > screen_size.y:
			increment_label("../Control/Score_player_down")
		else:
			increment_label("../Control/Score_player_up")
		position = Vector2(screen_size.x / 2, screen_size.y / 2)
		speed = init_speed
		var rng = RandomNumberGenerator.new()
		set_velocity(Vector2(rng.randf_range(-1, 1), rng.randf()).normalized() * init_speed)
		
func increment_label(node_path):
	get_node(node_path).text = str(int(get_node(node_path).text) + 1)
		
	
