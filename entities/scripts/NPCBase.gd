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
var named
signal dialog(name,text)

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
		if Input.is_action_just_pressed("Interact"):
			dialog.emit(named,greetings[randi() % greetings.size()])
			isRoaming = false
			is_chatting = true
			$sprite/AnimationPlayer.stop()
				
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
	named = names[randi() % names.size()]
	

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


var greetings = [
	"Hey there! Isn't the weather just perfect today?",
	"Hi, how's it going? Have you noticed those beautiful flowers blooming around?",
	"Hello! Did you catch a glimpse of the stunning garden nearby?",
	"Hey, friend! Isn't the sunshine lifting your spirits?",
	"Hiya! What's your favorite type of weather? I love a good sunny day!",
	"Hey, how's your day going? The breeze outside is so refreshing, isn't it?",
	"Hello! Do you have a favorite flower? I'm all about sunflowers myself.",
	"Hi! Did you see the rainbow after the rain? Nature's magic at its finest!",
	"Hey there! What's your go-to spot to enjoy a nice day outdoors?",
	"Hi, friend! I was just marveling at the clouds. Do you see any interesting shapes up there?",
	"Hello! I love the smell of fresh rain on the grass, don't you?",
	"Hey! Have you ever tried gardening? It's a fantastic way to connect with nature.",
	"Hiya! I'm curious, what's your favorite season and why?",
	"Hello! Isn't it amazing how flowers can brighten up any day?",
	"Hey, friend! How about we take a moment to appreciate the simple joys of a clear blue sky?",
	"Hi! Do you have any favorite flowers or plants you'd love to have in your garden?",
	"Hey there! What's your idea of a perfect day, weather-wise?",
	"Hello! I was just thinking about the tranquility of a peaceful garden. Do you have a favorite one?",
	"Hiya! Any exciting plans for the day, or are you just going to enjoy the weather?",
	"Hey! I love the sound of birds chirping in the morning. It's so soothing, isn't it?",
	"Hello, friend! How about we chat about our favorite outdoor activities? I love a good picnic!",
	"Hi! Have you ever tried your hand at flower arranging? It's surprisingly fun!",
	"Hey there! What's your take on rainy days? I find them quite cozy and calming.",
	"Hello! How about we share stories about our favorite outdoor adventures?",
	"Hiya! Do you have any tips for keeping a garden thriving? I'm trying my hand at gardening!",
	"Hey! Ever tried stargazing on a clear night? It's one of my favorite things to do.",
	"Hi, friend! I was just enjoying the breeze. Do you have a favorite outdoor spot?",
	"Hello! I can't get enough of the smell of freshly cut grass. Reminds me of lazy summer days.",
	"Hey there! Let's take a moment to appreciate the beauty of nature around us, shall we?",
	"Hi! I was just thinking about the simple joy of a hot cup of tea on a chilly day. What's your comfort drink?",
	"Hello, friend! Do you have any favorite weather-related memories?",
	"Hey! Isn't it fascinating how each season brings its own unique charm?","Hey there! How's the weather treating you today?",
	"Hi, friend! Have you noticed the colorful flowers in the neighborhood lately?",
	"Hello! I was just enjoying the sunshine. Do you have a favorite sunny activity?",
	"Hey! Any thoughts on the recent weather changes? I find it quite interesting.",
	"Hiya! What's your go-to spot for a relaxing time outdoors?",
	"Hey there! I spotted a cute little garden nearby. Have you explored it yet?",
	"Hello! The breeze outside is so invigorating. Don't you just love it?",
	"Hi, friend! Do you have a favorite flower or plant that always brings a smile to your face?",
	"Hey! I was thinking about the joy of a good rain shower. Do you like rainy days?",
	"Hiya! Let's talk about our favorite ways to enjoy a beautiful day. Any outdoor hobbies?",
	"Hey there! I've been experimenting with some new plants in my garden. Any gardening tips?",
	"Hello! What's your ideal weather for a perfect day?",
	"Hi! I'm a fan of the calming sound of raindrops. How about you?",
	"Hey! Ever tried your hand at creating a small indoor garden? It's a great way to bring nature inside.",
	"Hi, friend! Let's share stories about our favorite weather-related memories.",
	"Hello! I'm in the mood for a nice cup of hot cocoa. What's your favorite comfort drink?",
	"Hey there! Do you have a favorite season that you always look forward to?",
	"Hiya! I love the feeling of a crisp breeze on a cool morning. It's so refreshing!",
	"Hey! Have you ever explored a botanical garden? They're full of fascinating plants!",
	"Hello! I find the sound of rustling leaves to be incredibly soothing. What about you?",
	"Hi, friend! Let's chat about our favorite outdoor activities. Any special memories?",
	"Hey there! Do you have a favorite flower that holds a special meaning for you?",
	"Hello! I was just marveling at the beauty of a sunset. Have you seen any gorgeous skies lately?",
	"Hiya! What's your favorite way to spend a lazy afternoon when the weather is just right?",
	"Hey! I've been reading about different types of flowers. Any favorites on your list?",
	"Hi, friend! Let's take a moment to appreciate the little joys of everyday life. What's making you smile today?",
	"Hello! I find the smell of freshly baked bread on a cool day to be absolutely delightful. How about you?",
	"Hey there! I'm planning to have a cozy movie night. Any film recommendations?",
	"Hi! Let's share our favorite ways to unwind after a long day. What's your go-to relaxation method?",
	"Hello! I was just daydreaming about a perfect picnic. Do you enjoy outdoor picnics?",
	"Hey! How about we talk about our favorite things to do on a lazy Sunday afternoon?",
]
var names = [
	"Finn",
	"Jordan",
	"Casey",
	"Riley",
	"Taylor",
	"Alex",
	"Quinn",
	"Cameron",
	"Avery",
	"Charlie",
	"Sam",
	"Jamie",
	"Skyler",
	"Reese",
	"Morgan",
	"Dakota",
	"Emery",
	"Bailey",
	"Drew",
	"Peyton",
	"Dylan",
	"Morgan",
	"Alexis",
	"Jesse",
	"Finley",
	"Jordan",
	"Cameron",
	"Taylor",
	"Riley",
	"Cameron",
	"Peyton",
	"Jordan",
	"Charlie",
	"Drew",
	"Avery",
	"Reese",
	"Jordan",
	"Taylor",
	"Avery",
	"Skyler",
	"Peyton",
	"Jordan",
	"Cameron",
	"Drew",
	"Charlie",
	"Jordan",
	"Avery",
	"Reese",
	"Alex",
	"Riley",
	"Jamie",
	"Jordan",
	"Casey",
	"Cameron",
	"Taylor",
	"Reese",
	"Avery",
	"Skyler",
	"Peyton",
	"Jordan",
	"Drew",
	"Peyton",
	"Alex",
	"Quinn",
	"Morgan",
	"Avery",
	"Skyler",
	"Drew",
	"Reese",
	"Jordan",
	"Casey",
	"Taylor",
	"Riley",
	"Charlie",
	"Avery",
	"Jordan",
	"Cameron",
	"Quinn",
	"Alex",
	"Skyler",
	"Riley",
	"Drew",
	"Peyton",
	"Switch",
	"Aqureil"
]



func _on_starter_town_chat_done():
	isRoaming = true
	is_chatting = false
