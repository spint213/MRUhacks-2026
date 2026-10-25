extends clickable

@onready var label = $Label

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	super()
	$"..".show_dialogue_options.connect(show)
	$"..".hide_dialogue_options.connect(hide)

func emit_clickable_signal() -> void:
	SignalBus.first_chosen.emit()
	$"..".hide_dialogue_options.emit()
