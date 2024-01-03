extends CharacterBody2D

@onready var bodysprite = $sprite/Body
@onready var clothessprite = $sprite/Clothes
@onready var eyessprite = $sprite/Eyes
@onready var hairsprite = $sprite/Hair
@onready var accsprite = $sprite/Acc
const sprites = preload("res://entities/art/art.gd")
Global.playerAttacting = 2
Global.hair = randi_range(0,sprites.hair.size()-1)
Global.clothes = randi_range(0,sprites.clothes_spritesheet.size()-1)
Global.eyes = randi_range(0,sprites.eyes_spritesheet.size()-1)
Global.body = randi_range(0,sprites.body_spritesheet.size()-1)
Global.acc = randi_range(0,sprites.acc_spritesheet.size()-1)


func _ready():
	hairChange(hair)
	bodyChange(body)
	eyeChange(eyes)
	clothesChange(clothes)
	accChange(acc)
	

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
	hair += 1
	hair %= sprites.hair.size()
	hairChange(hair)

func _on_body_pressed():
	body += 1
	body %= sprites.body_spritesheet.size()
	bodyChange(body)


func _on_acc_pressed():
	acc += 1
	acc %= sprites.acc_spritesheet.size()
	accChange(acc)


func _on_clothes_pressed():
	clothes += 1
	clothes %= sprites.clothes_spritesheet.size()
	clothesChange(clothes)


func _on_eyes_pressed():
	eyes += 1
	eyes %= sprites.eyes_spritesheet.size()
	eyeChange(eyes)
