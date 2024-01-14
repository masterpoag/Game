extends Camera2D


func _ready():
	self.zoom = Vector2(4,4)
	match get_tree().get_current_scene().get_name():
		"city":
			self.zoom = Vector2(2,2)
			self.limit_bottom = 90000000
			self.limit_right = 900000000
			self.limit_top = -9000000
			self.limit_left = -90000000
		"starter town":
			self.limit_top = -96
			self.limit_bottom = 400
			self.limit_right = 544
			self.limit_left = -48


func _physics_process(_delta):
	position.x = Global.posx
	position.y = Global.posy
