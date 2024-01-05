extends Control

signal health_changed(value, displacement)
signal exp_change(value)
signal max_exp_change(value)
signal max_health_changed(value)
signal levelup(level)

func _on_player_health_changed(value, displacement):
	health_changed.emit(value,displacement)


func _on_player_max_health_changed(value):
	max_health_changed.emit(value)

func _on_player_exp_change(value):
	exp_change.emit(value)


func _on_player_levelup(level):
	levelup.emit(level)
