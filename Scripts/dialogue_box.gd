extends RichTextLabel

var dialogue: PackedStringArray
var curr_line: int

func _ready() -> void:
	set_dialogue_script("res://Dialogue/test_dialogue.txt")

func set_dialogue_script(script_path: String) -> void:
	curr_line = 0
	var file = FileAccess.open(script_path, FileAccess.READ)
	var file_content = file.get_as_text()
	dialogue = file_content.split(";")

func next_line() -> void:
	print(curr_line)
	print(dialogue.size())
	if curr_line < dialogue.size() - 1:
		curr_line += 1
	else:
		dialogue[curr_line] = "end of dialogue"

func update_text() -> void:
	text = dialogue[curr_line]
	print(dialogue[curr_line])

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_accept"):
		update_text()
		next_line()
