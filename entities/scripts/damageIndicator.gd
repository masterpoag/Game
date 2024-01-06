extends Control

var speed = 30
var friction = 15
var SHIFT_DIRECTION = Vector2.ZERO
@export var damage : int
@onready var label = $Label

func _ready():
	SHIFT_DIRECTION = Vector2(randfn(-1,1),randfn(-1,1))
	$Label.text = str(damage)

func _process(delta):
	global_position += speed * SHIFT_DIRECTION * delta
	speed = max(speed - friction * delta,0)
