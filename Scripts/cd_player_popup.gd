extends Control


func _ready() -> void:
	SignalBus.cd_click.connect(cd_player_pop)

func cd_player_pop() -> void:
	show()
	SignalBus.deploy_popup_barrier.emit()

func cd_player_close() -> void:
	SignalBus.collapse_popup_barrier.emit()
