extends RichTextLabel

var dialogue: PackedStringArray
var curr_line: int
var chosen_first = false
var showing_response = false

func _ready() -> void:
	SignalBus.first_chosen.connect(choose_first)
	SignalBus.second_chosen.connect(choose_second)

func set_dialogue_script(dialogue_array: PackedStringArray) -> void:
	curr_line = 0
	dialogue = dialogue_array

func next_line() -> void:
	if $"..".is_playing:
		if !$"..".is_choosing:
			if showing_response:
				if chosen_first:
					curr_line += 2
				else:
					curr_line += 1
				showing_response = false
			elif dialogue[curr_line] == "\nset_choices":
				$"../First".label.text = dialogue[curr_line + 1]
				$"../Second".label.text = dialogue[curr_line + 2]
				curr_line += 3
			elif dialogue[curr_line] == "\nchoose":
				$"..".show_dialogue_options.emit()
				$"..".is_choosing = true
				return
			else:
				curr_line += 1
			if curr_line >= dialogue.size():
				SignalBus.dialogue_end.emit()
				return
		update_text()

func update_text() -> void:
	if curr_line >= dialogue.size():
		SignalBus.dialogue_end.emit()
		return
	if dialogue[curr_line] != "\nset_choices" and dialogue[curr_line] != "\nchoose":
		$".".text = dialogue[curr_line]

func choose_first() -> void:
	chosen_first = true
	showing_response = true
	curr_line += 1
	$"..".is_choosing = false
	update_text()

func choose_second() -> void:
	chosen_first = false
	showing_response = true
	curr_line += 2
	$"..".is_choosing = false
	update_text()

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("next"):
		next_line()
