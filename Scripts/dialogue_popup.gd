extends Control

signal show_dialogue_options
signal hide_dialogue_options
signal set_dialogue_options(string_array: PackedStringArray, index: int)

var dialogue: PackedStringArray
var is_playing: bool
var is_choosing: bool

func _ready() -> void:
	SignalBus.dialogue_start.connect(start_dialogue)
	SignalBus.dialogue_end.connect(end_dialogue)

func set_dialogue_sprite(new_texture: Texture2D) -> void:
	$Sprite.texture = new_texture

func set_dialogue(file_path) -> void:
	var file = FileAccess.open(file_path, FileAccess.READ)
	var file_content = file.get_as_text()
	dialogue = file_content.split(";")
	set_dialogue_options.emit(dialogue)
	$DialogueTextbox.set_dialogue_script(dialogue)

func start_dialogue(file_path) -> void:
	is_playing = true
	show()
	set_dialogue(file_path)
	SignalBus.deploy_popup_barrier.emit()

func end_dialogue() -> void:
	hide()
	is_playing = false
	SignalBus.collapse_popup_barrier.emit()
	SignalBus.visitor_exit.emit()
