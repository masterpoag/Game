extends CharacterBody2D
var lastPos
const speed = 30
var currentState = 2
var isRoaming = true
var is_chatting = false
var directions = [Vector2.RIGHT,Vector2.DOWN,Vector2.UP,Vector2.LEFT]
var timer = [0.2, .5, 1, 1.5]
var player
var playerIsChatZone = false
var states = [IDLE,new_DIR, MOVE]
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
	if isRoaming:
		match currentState:
			IDLE:
				pass
			new_DIR:
				direction = directions[randi() % directions.size()]
			MOVE:
				move(delta)
				
	if position == lastPos and currentState != IDLE:
		_on_timer_timeout()


func _ready():
	randomize()
	startPos = position
	hairChange(randi_range(0,sprites.hair.size()-1))
	bodyChange(randi_range(0,sprites.body_spritesheet.size()-1))
	eyeChange(randi_range(0,sprites.eyes_spritesheet.size()-1))
	clothesChange(randi_range(0,sprites.clothes_spritesheet.size()-1))
	accChange(0)

func move(delta):
	if !is_chatting:
		position += direction * speed * delta
		move_and_slide()


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


func _on_chat_detection_area_body_entered(body):
	if body.is_in_group("Player"):
		player = body
		playerIsChatZone = true


func _on_chat_detection_area_body_exited(body):
	if body.is_in_group("Player"):
		playerIsChatZone= false


func _on_timer_timeout():
	$Timer.wait_time = timer[randi() % timer.size()]
	currentState = states[randi() % states.size()]
