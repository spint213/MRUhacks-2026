extends clickable

@export var dialogue_path: String

func _ready() -> void:
	super()
	SignalBus.visitor_enter.connect(visitor_enter)
	dialogue_path = "res://Dialogue/l'amour.txt"

func emit_clickable_signal() -> void:
	visitor_exit()
	SignalBus.dialogue_start.emit(dialogue_path)

func visitor_enter() -> void:
	show()

func visitor_exit() -> void:
	hide()

func change_costume(new_sprite: Texture2D) -> void:
	sprite.texture = new_sprite
