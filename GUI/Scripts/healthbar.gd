extends Control
var maxhealth = 100
var health

func _on_interface_max_health_changed(value):
	$TextureProgressBar.max_value = value
	var maxhealth = value
	$NinePatchRect/Label.text = "%s/%s" % [health,maxhealth]


func _on_interface_health_changed(value, displacement):
	$TextureProgressBar.value = value
	health = value
	$NinePatchRect/Label.text = "%s/%s" % [value,maxhealth]

