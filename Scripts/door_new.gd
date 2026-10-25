extends clickable

@export var opened: Texture2D
@export var closed: Texture2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	super()

func emit_clickable_signal() -> void:
	SignalBus.visitor_enter.emit()
	open_door()

func open_door() -> void:
	sprite.texture = opened
	await get_tree().create_timer(4.0).timeout
	close_door()

func close_door() -> void:
	sprite.texture = closed
