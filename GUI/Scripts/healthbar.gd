extends Control
var maxhealth = 100

func _on_interface_max_health_changed(value):
	$TextureProgressBar.max_value = value
	var maxhealth = value


func _on_interface_health_changed(value, displacement):
	print($bar.value) 
	$NinePatchRect/Label.test = "%s/%s" % [value,maxhealth]

