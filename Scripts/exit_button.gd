class_name exit_button extends clickable


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	super()

func emit_clickable_signal() -> void:
	$".".get_parent().hide()
	SignalBus.collapse_popup_barrier.emit()
