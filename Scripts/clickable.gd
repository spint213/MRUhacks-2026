class_name clickable extends Area2D

@onready var root = $"."

@export var sprite_texture: Texture2D
@export var starting_scale: Vector2
var sprite: Sprite2D
var hovering: bool

func _ready() -> void:
	sprite = Sprite2D.new()
	add_child(sprite)
	sprite.scale = starting_scale
	sprite.texture = sprite_texture
	mouse_entered.connect(_on_mouse_entered)
	mouse_exited.connect(_on_mouse_exited)

func _on_mouse_entered() -> void:
	scale *= 1.1
	hovering = true

func _on_mouse_exited() -> void:
	scale /= 1.1
	hovering = false

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("left_click") and hovering:
		var callable = Callable(root, "emit_clickable_signal")
		callable.call()

func emit_clickable_signal() -> void:
	pass
