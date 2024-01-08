extends StaticBody2D

var hovering = false

func _ready():
	pass

func _input(event):
	if event is InputEventMouseButton and hovering:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			print("Left clicked")
		if event.button_index == MOUSE_BUTTON_RIGHT and event.pressed:
			print("Right clicked")


func _on_mouse_entered():
	print("hovering")
	hovering = true


func _on_mouse_exited():
	hovering = false
