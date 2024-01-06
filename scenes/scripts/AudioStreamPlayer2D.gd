extends AudioStreamPlayer2D


func _on_finished():
	self.play()
func _ready():
	self.play()
	self.process_mode = Node.PROCESS_MODE_ALWAYS
