extends clickable


func _ready() -> void:
	super()


func emit_clickable_signal() -> void:
	SignalBus.mirror_click.emit()
