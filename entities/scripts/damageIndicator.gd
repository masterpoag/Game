extends Node2D

var speed = 30
var friction = 15
var SHIFT_DIRECTION = Vector2.ZERO

@onready var label = $Label

func _ready():
	SHIFT_DIRECTION = Vector2(randfn(-1,1),randfn(-1,1))
	$CanvasLayer/Label.text = Global.damage
	self.position.x = Global.pos[0]
	self.position.y = Global.pos[1] 

func _process(delta):
	global_position += speed * SHIFT_DIRECTION * delta
	speed = max(speed - friction * delta,0)
