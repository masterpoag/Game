extends Camera2D


func _ready():
	self.zoom = Vector2(4,4)
	match get_tree().get_current_scene().get_name():
		"city":
			self.zoom = Vector2(2,2)
			self.limit_bottom = 992
			self.limit_right = 5152
			self.limit_top = -1008
			self.limit_left = -48
		"starter town":
			self.limit_top = -96
			self.limit_bottom = 400
			self.limit_right = 544
			self.limit_left = -48


func _physics_process(_delta):
	position.x = Global.posx
	position.y = Global.posy
