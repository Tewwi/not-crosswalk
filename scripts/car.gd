extends Node2D

const SPEED = 200
var DIR = Vector2.LEFT
const colors := ["Green", "Red", "Yellow"]

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# Random 1 trong 3 màu xe
	var chosen: String = colors[randi() % colors.size()]
	
	$Green.visible = chosen == "Green"
	$Red.visible = chosen == "Red"
	$Yellow.visible = chosen == "Yellow"

	if position.x < 0:
		DIR = Vector2.RIGHT


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position += SPEED * DIR * delta

func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	queue_free()
