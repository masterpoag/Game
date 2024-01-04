extends CharacterBody2D

@onready var bodysprite = $sprite/Body
@onready var clothessprite = $sprite/Clothes
@onready var eyessprite = $sprite/Eyes
@onready var hairsprite = $sprite/Hair
@onready var accsprite = $sprite/Acc
const sprites = preload("res://entities/art/art.gd")
var selected



func _ready():
	Global.hair = randi_range(0,sprites.hair.size()-1)
	Global.clothes = randi_range(0,sprites.clothes_spritesheet.size()-1)
	Global.eyes = randi_range(0,sprites.eyes_spritesheet.size()-1)
	Global.body = randi_range(0,sprites.body_spritesheet.size()-1)
	Global.acc = randi_range(0,sprites.acc_spritesheet.size()-1)
	
	hairChange(Global.hair)
	bodyChange(Global.body)
	eyeChange(Global.eyes)
	clothesChange(Global.clothes)
	accChange(Global.acc)
	

func hairChange(factor):
	hairsprite.texture = sprites.hair[factor]
	#hairsprite.Modulate(randi_range(0,255),randi_range(0,255),randi_range(0,255))
func accChange(factor):
	$sprite/Acc.hframes = sprites.acc_Hframes[factor]
	accsprite.texture = sprites.acc_spritesheet[factor]
	#accsprite.Modulate(randi_range(0,255),randi_range(0,255),randi_range(0,255))
func clothesChange(factor):
	$sprite/Clothes.hframes = sprites.clothes_Hframes[factor]
	clothessprite.texture = sprites.clothes_spritesheet[factor]
	#clothessprite.Modulate(randi_range(0,255),randi_range(0,255),randi_range(0,255))
func eyeChange(factor):
	$sprite/Eyes.hframes = sprites.eye_Hframes[factor]
	eyessprite.texture = sprites.eyes_spritesheet[factor]
	#eyessprite.Modulate(randi_range(0,255),randi_range(0,255),randi_range(0,255))
func bodyChange(factor):
	bodysprite.texture = sprites.body_spritesheet[factor]
	#bodysprite.Modulate(randi_range(0,255),randi_range(0,255),randi_range(0,255))

func _process(delta):
	$sprite/AnimationPlayer.play("front walk")


func _on_hair_pressed():
	Global.hair += 1
	Global.hair %= sprites.hair.size()
	hairChange(Global.hair)

func _on_body_pressed():
	Global.body += 1
	Global.body %= sprites.body_spritesheet.size()
	bodyChange(Global.body)


func _on_acc_pressed():
	Global.acc += 1
	Global.acc %= sprites.acc_spritesheet.size()
	accChange(Global.acc)


func _on_clothes_pressed():
	Global.clothes += 1
	Global.clothes %= sprites.clothes_spritesheet.size()
	clothesChange(Global.clothes)


func _on_eyes_pressed():
	Global.eyes += 1
	Global.eyes %= sprites.eyes_spritesheet.size()
	eyeChange(Global.eyes)


func _on_color_picker_color_changed(color):
	match(selected):
		0:
			hairsprite.self_modulate = color
			Global.hair_mod = color
		1:
			bodysprite.self_modulate = color
			Global.body_mod = color
		2:
			accsprite.self_modulate = color
			Global.acc_mod = color
		3:
			clothessprite.self_modulate = color
			Global.clothes_mod = color
		4:
			eyessprite.self_modulate = color
			Global.eyes_mod = color




func _on_option_button_item_selected(index):
	selected = index
