extends Node2D

var car: PackedScene = preload("res://scenes/car1.tscn")
var score: int = 0

func go_to_title(body):
	if body.name == "Player":
		print("Ouch!")

func _on_car_timer_timeout() -> void:
	var yellow = car.instantiate() as Area2D
	var start_pos = $CarStartPositions.get_children().pick_random() as Marker2D
	yellow.position = start_pos.position
	$Objects.add_child(yellow)
	yellow.connect("body_entered", go_to_title)

func _on_timer_timeout() -> void:
	score += 1
	$CanvasLayer/Label.text = str(score)
