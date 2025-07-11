extends CharacterBody2D

var speed = 400  # How fast the player will move (pixels/sec).
var screen_size  # Size of the game window.
var size  #size of the sheep

func _ready():
	print("READY")
	screen_size = get_viewport_rect().size
	size = $shape.shape.get_rect().size
	
	print(size)
	
func _process(_delta):
	velocity = Vector2.ZERO
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
	
	#position += velocity * delta
	#position.x = clamp(position.x, size.x / 2, screen_size.x - size.x / 2)
	#position.y = clamp(position.y ,  size.y / 2, screen_size.y - size.y / 2)
	move_and_slide()
	


func _on_body_entered(body: Node) -> void:
	print(body.name)
