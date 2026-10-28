extends Node2D

@export var menu_colour_palatte: Color

func _ready() -> void:
	$AudioStreamPlayer2D.play()

func play_game() -> void:
	set_modulate(menu_colour_palatte)
	await get_tree().create_timer(3.0).timeout
	get_tree().change_scene_to_file("res://main.tscn")
