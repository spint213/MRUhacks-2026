extends clickable

@export var dialogue: String
@export var costume: Texture2D

func _ready() -> void:
	super()
	SignalBus.visitor_enter.connect(visitor_enter)

func emit_clickable_signal() -> void:
	visitor_exit()
	SignalBus.minigame_start.emit(dialogue)

func visitor_enter() -> void:
	show()

func visitor_exit() -> void:
	hide()

func change_costume(new_sprite: Texture2D) -> void:
	sprite.texture = new_sprite
