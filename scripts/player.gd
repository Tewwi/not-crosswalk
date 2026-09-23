extends CharacterBody2D

const SPEED = 80
var dir: Vector2 = Vector2.ZERO

func _physics_process(_delta: float) -> void:
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	dir = Input.get_vector("left", "right", "up", "down")
	velocity = dir * SPEED
	
	animation()
	move_and_slide()

func animation() -> void:
	if dir:
		if dir.x != 0:
			$AnimatedSprite2D.play("left")
			$AnimatedSprite2D.flip_h = dir.x > 0
		if dir.y != 0:
			var spriteDir = "up" if dir.y < 0 else "down"
			$AnimatedSprite2D.play(spriteDir)
	else:
		$AnimatedSprite2D.frame = 0
