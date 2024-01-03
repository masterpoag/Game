extends Node2D

var slime = load("res://entities/slime.tscn")
var nodes : Array = []
var slimeInstance
func _process(delta):
	if self.get_child_count() == 0:
		for i in range(randi_range(1,5)):
			slimeInstance = slime.instantiate()
			slimeInstance.position = Vector2(randi_range(-48,500),randi_range(-95,392))
			add_child(slimeInstance)


