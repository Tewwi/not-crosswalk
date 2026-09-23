extends Node2D


const car_scene: PackedScene = preload("res://scene/car.tscn")
var score = 0

func update_score() -> void:
	$CanvasLayer/Label.text = "Score: " + str(score)

func _on_area_2d_body_entered(_body: Node2D) -> void:
	if score < Global.globarScore:
		Global.globarScore = score
	if Global.globarScore == 0:
		Global.globarScore = score
		
	await get_tree().create_timer(2.0).timeout
	call_deferred("change_screen")

func change_screen():
	get_tree().change_scene_to_file("res://scene/main_menu.tscn")

func _on_car_spawn_timeout() -> void:
	var car = car_scene.instantiate() as Area2D
	var positionMarker = $CarsMarker.get_children().pick_random() as Marker2D
	car.position = positionMarker.position
	
	$Objects.add_child(car)
	car.connect("body_entered", on_hit)

func on_hit(_body: Node2D) -> void:
	await get_tree().create_timer(0.2).timeout
	call_deferred("change_screen")
	

func _on_score_timeout() -> void:
	score += 1
	update_score()
