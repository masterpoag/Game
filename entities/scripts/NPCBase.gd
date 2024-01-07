extends CharacterBody2D

const speed = 30
var currentState = 2
var isRoaming = true
var is_chatting = false

var player
var playerIsChatZone = false

var direction = Vector2.RIGHT
var startPos
enum {
	IDLE,
	new_DIR,
	MOVE
}

#Char customization
@onready var bodysprite = $sprite/Body
@onready var clothessprite = $sprite/Clothes
@onready var eyessprite = $sprite/Eyes
@onready var hairsprite = $sprite/Hair
@onready var accsprite = $sprite/Acc
const sprites = preload("res://entities/art/art.gd")
#----------------------------------------------------------------
func _process(delta):
	if currentState == 0 or currentState == 1:
		$sprite/AnimationPlayer.stop()
	elif currentState == 2 and !is_chatting:
		if direction.x == -1:
			$sprite/AnimationPlayer.play("left walk")
		if direction.x == 1:
			$sprite/AnimationPlayer.play("right walk")
		if direction.y == -1:
			$sprite/AnimationPlayer.play("back walk")
		if direction.y == 1:
			$sprite/AnimationPlayer.play("front walk")


func _ready():
	randomize()
	startPos = position
	
	
	hairChange(randi_range(0,sprites.hair.size()-1))
	bodyChange(randi_range(0,sprites.body_spritesheet.size()-1))
	eyeChange(randi_range(0,sprites.eyes_spritesheet.size()-1))
	clothesChange(randi_range(0,sprites.clothes_spritesheet.size()-1))
	accChange(randi_range(0,sprites.acc_spritesheet.size()-1))


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
