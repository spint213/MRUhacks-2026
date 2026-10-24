extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	SignalBus.minigame_start.connect(mini_pop)
	SignalBus.door_click.connect(door_pop)

func mini_pop() -> void:
	pass

func door_pop() -> void:
	print("There is someone at the door...")
