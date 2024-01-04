extends Control
var maxexp = 25
var exp

func _on_interface_exp_change(value):
	$TextureProgressBar.value = value
	exp = value
	$NinePatchRect/Label.text = "%s/%s" % [value,maxexp]


func _on_interface_max_exp_change(value):
	$TextureProgressBar.max_value = value
	var maxhealth = value
	$NinePatchRect/Label.text = "%s/%s" % [exp,maxexp]
