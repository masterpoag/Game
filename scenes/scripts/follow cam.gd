extends Camera2D


func _ready():
	self.zoom = Vector2(4,4)
	match get_tree().get_current_scene().get_name():
		"city":
			print("city")
			self.limit_bottom = 192 
			self.limit_right = 448
			self.limit_top = -112
			self.limit_left = -48
		"starter forest":
			print("starter")
			self.limit_top = -48
			self.limit_bottom = 392
			self.limit_right = 544
			self.limit_left = -48


func _physics_process(delta):
	position.x = Global.posx
	position.y = Global.posy
