extends Node2D

func _on_quit_pressed():
	get_tree().quit()


func _on_play_pressed():
	get_tree().change_scene_to_file("res://scenes/charater_select.tscn")


func _on_audio_stream_player_2d_finished():
	$AudioStreamPlayer2D.play()

func _ready():
	$AudioStreamPlayer2D.play()
