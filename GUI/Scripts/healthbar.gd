extends Control
var maxhealth = 100
var health

func _on_interface_max_health_changed(value):
	$CenterContainer/HBoxContainer/TextureProgressBar.max_value = value
	maxhealth = value
	$CenterContainer/HBoxContainer/TextureProgressBar/Label.text = "%s/%s" % [health,value]


func _on_interface_health_changed(value, _displacement):
	$CenterContainer/HBoxContainer/TextureProgressBar.value = value
	health = value
	$CenterContainer/HBoxContainer/TextureProgressBar/Label.text = "%s/%s" % [value,maxhealth]

