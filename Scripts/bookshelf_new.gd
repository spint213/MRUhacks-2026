extends clickable

var shelf: Array

func _ready() -> void:
	super()

func add_book(book) -> void:
	shelf.append(book)

func emit_clickable_signal() -> void:
	SignalBus.bookshelf_click.emit()
