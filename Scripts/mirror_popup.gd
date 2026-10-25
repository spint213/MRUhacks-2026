extends Control


func _ready() -> void:
	SignalBus.mirror_click.connect(mirror_pop)

func mirror_pop() -> void:
	show()
	SignalBus.deploy_popup_barrier.emit()

func mirror_close() -> void:
	SignalBus.collapse_popup_barrier.emit()
