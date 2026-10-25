extends Control

var choices:Array
var is_playing: bool

func _ready() -> void:
	SignalBus.minigame_start.connect(start_minigame)

func set_choices(file_path) -> void:
	var file = FileAccess.open(file_path, FileAccess.READ)
	var file_choices = file.get_as_text()
	for file_choice in file_choices:
		choices.append(file_choice)

func create_choices() -> void:
	var first = Button.new()
	var second = Button.new()
	first.pressed.connect(choose_first)
	second.pressed.connect(choose_second)
	first.size = Vector2(200,20)
	second.size = Vector2(200,20)
	$MarginContainer/HBoxContainer.add_child(first)
	$MarginContainer/HBoxContainer.add_child(second)
	first.text = choices[0]
	second.text = choices[1]

func choose_first() -> void:
	print("choosing first")

func choose_second() -> void:
	pass

func start_minigame(file_path) -> void:
	is_playing = true
	show()
	set_choices(file_path)
	create_choices()

func end_minigame() -> void:
	hide()
	is_playing = false
