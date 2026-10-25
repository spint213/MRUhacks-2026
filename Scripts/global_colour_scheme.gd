extends Node

var joy: int
var gloom: int

@onready var yellow: Color = Color.LIGHT_YELLOW
@onready var navy: Color = Color.NAVY_BLUE
@onready var gray: Color = Color.DIM_GRAY

@onready var curr_colour

func _ready() -> void:
	SignalBus.first_chosen.connect(add_joy)
	SignalBus.second_chosen.connect(add_gloom)
	SignalBus.end.connect(set_colour)

func add_joy() -> void:
	joy += 1

func add_gloom() -> void:
	gloom += 1

func set_colour() -> void:
	if joy > gloom:
		curr_colour = yellow
	if joy < gloom:
		curr_colour = navy
	if joy == gloom:
		curr_colour = gray
	SignalBus.modulate_colour.emit()
