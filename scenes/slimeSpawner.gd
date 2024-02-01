extends Node2D

var slime = load("res://entities/slime.tscn")
var nodes : Array = []
var slimeInstance
func _process(_delta):
	if self.get_child_count() <= 100:
		slimeInstance = slime.instantiate()
		slimeInstance.position = Vector2(randi_range(-48,5152),randi_range(992,-1008))
		add_child(slimeInstance)
