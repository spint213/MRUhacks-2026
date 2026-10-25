extends Node2D

var end = 0
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	SignalBus.deploy_popup_barrier.connect($PopupBarrier.show)
	SignalBus.collapse_popup_barrier.connect($PopupBarrier.hide)
	SignalBus.visitor_exit.connect(swap_visitor)

func swap_visitor() -> void:
	var new_sprite_texture = load("res://Assets_New/nurse_chibi.png")
	var new_dialogue_texture = load("res://Assets_New/nurse_closeup.png")
	$Visitor.change_costume(new_sprite_texture)
	$DialoguePopup.set_dialogue_sprite(new_dialogue_texture)
	$Visitor.dialogue_path = "res://Dialogue/nurse.txt"
	end += 1
	print(end)
	if end == 2:
		SignalBus.end.emit()
