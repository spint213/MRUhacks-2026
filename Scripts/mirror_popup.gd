extends Control


func _ready() -> void:
	SignalBus.mirror_click.connect(show)

func _on_exit_button_pressed() -> void:
	hide()
