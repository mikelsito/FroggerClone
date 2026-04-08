extends Node2D

var car_1: PackedScene = preload("res://scenes/car1.tscn")

func go_to_title(body):
	if body.name == "Player":
		print("Ouch!")

func _on_car_timer_timeout() -> void:
	var yellow = car_1.instantiate() as Area2D
	var start_pos = $CarStartPositions.get_children().pick_random() as Marker2D
	yellow.position = start_pos.position
	$Objects.add_child(yellow)
	yellow.connect("body_entered", go_to_title)
