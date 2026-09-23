extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if Global.globarScore == 0:
		$Label2.text = 'High score: --'
		pass
	$Label2.text = 'High score: ' + str(Global.globarScore)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass


func _on_start_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scene/game.tscn")
	pass # Replace with function body.
