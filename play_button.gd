extends clickable


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	super()

func emit_clickable_signal() -> void:
	SignalBus.play_song.emit()
