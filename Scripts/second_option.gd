extends clickable

@onready var label = $Label

func _ready() -> void:
	super()
	$"..".show_dialogue_options.connect(show)
	$"..".hide_dialogue_options.connect(hide)

func emit_clickable_signal() -> void:
	SignalBus.second_chosen.emit()
	$"..".hide_dialogue_options.emit()
