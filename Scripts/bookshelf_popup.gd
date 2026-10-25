extends Control


func _ready() -> void:
	SignalBus.bookshelf_click.connect(bookshelf_pop)

func bookshelf_pop() -> void:
	show()
	SignalBus.deploy_popup_barrier.emit()

func bookshelf_close() -> void:
	SignalBus.collapse_popup_barrier.emit()
