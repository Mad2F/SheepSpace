extends Node2D

var speed = 400  # How fast the player will move (pixels/sec).
var screen_size  # Size of the game window.
var size = $body.get_node("shape").shape.get_rect().size #size of the sheep

func _ready():
	screen_size = get_viewport_rect().size
	print(size)
	
func _process(delta):
	var velocity = Vector2()  # The player's movement vector.
	if Input.is_action_pressed("ui_right"):
		velocity.x += 1
	if Input.is_action_pressed("ui_left"):
		velocity.x -= 1
	if Input.is_action_pressed("ui_down"):
		velocity.y += 1
	if Input.is_action_pressed("ui_up"):
		velocity.y -= 1
	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
	
	position += velocity * delta
	position.x = clamp(position.x, size.x / 2, screen_size.x - size.x / 2)
	position.y = clamp(position.y ,  size.y / 2, screen_size.y - size.y / 2)
