extends TileMap


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	self.modulate = Color8(randi_range(0,255),randi_range(0,255),randi_range(0,255))
