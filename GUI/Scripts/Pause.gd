extends Control
var state
func _input(event):
	if event.is_action_pressed("pause"):
		pause()
		
func _ready():
	$CanvasLayer.visible = false




func _on_button_pressed():
	pause()


func _on_button_2_pressed():
	pause()
	get_tree().change_scene_to_file("res://scenes/title.tscn")

func pause():
	state = not get_tree().paused
	get_tree().paused = state
	$CanvasLayer.visible = state

func _on_button_3_pressed():
	get_tree().quit()
