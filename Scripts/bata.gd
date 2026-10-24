extends clickable


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	mouse_entered.connect(_on_mouse_entered)
	mouse_exited.connect(_on_mouse_exited)

func _on_mouse_entered() -> void:
	scale *= 1.1
	hovering = true

func _on_mouse_exited() -> void:
	scale /= 1.1
	hovering = false
