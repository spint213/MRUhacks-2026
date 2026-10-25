extends clickable

var is_playing: bool
var num_songs: int = 0

var happy_points: int
var sad_points: int

@export var first_song_parts: Array[AudioStreamWAV]
@export var second_song_parts: Array[AudioStreamWAV]
@export var third_song_parts: Array[AudioStreamWAV]
@export var fourth_song_parts: Array[AudioStreamWAV]
@export var fifth_song_parts: Array[AudioStreamWAV]
@export var sixth_song_parts: Array[AudioStreamWAV]

@export var final_song: Array[AudioStreamWAV]

var choice_index: int = 0


func _ready() -> void:
	super()
	SignalBus.first_chosen.connect(choose_first)
	SignalBus.second_chosen.connect(choose_second)
	SignalBus.play_song.connect(play_song)


func emit_clickable_signal() -> void:
	SignalBus.cd_click.emit()


func choose_first() -> void:
	if choice_index >= 6:
		return
	match choice_index:
		0:
			if first_song_parts.size() > 0:
				$AudioStreamPlayer.stream = first_song_parts[0]
		1:
			if second_song_parts.size() > 0:
				$AudioStreamPlayer.stream = second_song_parts[0]
		2:
			if third_song_parts.size() > 0:
				$AudioStreamPlayer.stream = third_song_parts[0]
		3:
			if fourth_song_parts.size() > 0:
				$AudioStreamPlayer.stream = fourth_song_parts[0]
		4:
			if fifth_song_parts.size() > 0:
				$AudioStreamPlayer.stream = fifth_song_parts[0]
		5:
			if sixth_song_parts.size() > 0:
				$AudioStreamPlayer.stream = sixth_song_parts[0]
	choice_index += 1
	happy_points += 1
	$AudioStreamPlayer.play()


func choose_second() -> void:
	if choice_index >= 6:
		return
	match choice_index:
		0:
			if first_song_parts.size() > 1:
				$AudioStreamPlayer.stream = first_song_parts[1]
		1:
			if second_song_parts.size() > 1:
				$AudioStreamPlayer.stream = second_song_parts[1]
		2:
			if third_song_parts.size() > 1:
				$AudioStreamPlayer.stream = third_song_parts[1]
		3:
			if fourth_song_parts.size() > 1:
				$AudioStreamPlayer.stream = fourth_song_parts[1]
		4:
			if fifth_song_parts.size() > 1:
				$AudioStreamPlayer.stream = fifth_song_parts[1]
		5:
			if sixth_song_parts.size() > 1:
				$AudioStreamPlayer.stream = sixth_song_parts[1]
	choice_index += 1
	happy_points += 1
	$AudioStreamPlayer.play() 

func get_length() -> int:
	return num_songs


func play_song() -> void:
	if happy_points <= sad_points:
		$AudioStreamPlayer.stream = final_song[0]
	else:
		$AudioStreamPlayer.stream = final_song[1]
	$AudioStreamPlayer.play()


func stop_song() -> void:
	is_playing = false
	$AudioStreamPlayer.stop()
