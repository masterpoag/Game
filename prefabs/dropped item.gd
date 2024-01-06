extends StaticBody2D
@onready var player = preload("res://inventory system/inventories/player.tres")
var item
var size = Vector2.ZERO

func _ready():
	$Sprite2D.texture = item.texture
	if size != Vector2.ZERO:
		self.scale = size


func _on_pickuprange_body_entered(body):
	if body.is_in_group("Player"):
		body.collect(item)
		self.queue_free()
