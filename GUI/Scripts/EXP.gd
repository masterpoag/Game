extends Control
var max_value
var target_exp

func _on_interface_exp_change(value):
	for line in value:
		target_exp = line[0]
		var max_exp = line[1]
		max_value = max_exp
		$CenterContainer/HBoxContainer/bar.value = target_exp
		$CenterContainer/HBoxContainer/bar.max_value = max_exp
		$CenterContainer/HBoxContainer/bar/Label.text = "%s/%s" % [target_exp,max_exp]
