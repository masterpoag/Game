extends Label



func _on_interface_levelup(level):
	self.text = "Level: %s" % [level]
