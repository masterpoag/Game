extends CharacterBody2D

# UI system
signal health_changed(value, displacement)
signal exp_change(value)
signal max_health_changed(value)
signal levelup(level)

#----------------------------------------------------------------

# CHARACTER STATS
var max_hp = 100; var health = 100; var maxhealth = 100
var strength = 1; var damage = 10
var speed = 75


#----------------------------------------------------------------

# LEVELING SYSTEM
var level = 1
var experience_total = 0
var experience = 0

var experience_required = get_required_experience(level + 1)
func get_required_experience(level):
	return round(pow(level, 1.8) + level * 4)

func gain_experience(amount):
	experience_total += amount
	experience+= amount
	var growth_data = []
	while experience >= experience_required:
		experience -= experience_required
		growth_data.append([experience_required, experience_required])
		level_up()
		
	growth_data.append([experience, get_required_experience(level + 1)])
	emit_signal("exp_change", growth_data)

func level_up():
	
	level += 1
	levelup.emit(level)
	experience_required = get_required_experience(level + 1)
	var stats = ['max_hp', 'strength']
	var random_stat = stats[randi() % stats.size()]
	set(random_stat, get(random_stat) + randi() % 10)
	if strength > 1:
		damage += round(strength/(2*level))
	if random_stat == stats[0]:
		maxhealth = max_hp
		max_health_changed.emit(maxhealth)
	if health != maxhealth:
		health = maxhealth
		health_changed.emit(maxhealth,maxhealth-health)
#----------------------------------------------------------------

# Inventory system
@export var inv: Inv
#----------------------------------------------------------------

#Char customization
@onready var bodysprite = $sprite/Body
@onready var clothessprite = $sprite/Clothes
@onready var eyessprite = $sprite/Eyes
@onready var hairsprite = $sprite/Hair
@onready var accsprite = $sprite/Acc
const sprites = preload("res://entities/art/art.gd")
#----------------------------------------------------------------

var current_dir
var chatting = false

#combat system
var enemyRange = false
var cooldown= 20
var inCooldown = false
var attack = false
var healingStart = false
var damageable = true
var invable = 0
var playerAlive = true
var globalBody
#----------------------------------------------------------------


#logging
var last = 0
#----------------------------------------------------------------

func _ready():
	if Global.lastLoaded == "Guild":
		position = Vector2(262,321)
		Global.lastLoaded == "City"
	attack = false
	# this shouldnt be needed anymore
#	if !Global.firstvisit && get_tree().get_current_scene().get_name() == "city":
#		position.x= -38
#		position.y= 47
	
#	sets char to what the player wanted
	hairChange(Global.hair)
	bodyChange(Global.body)
	eyeChange(Global.eyes)
	clothesChange(Global.clothes)
	accChange(Global.acc)
	#----------------------------------------------------------------
	
#	sets modulation that the player wants
	hairsprite.self_modulate = Global.hair_mod
	bodysprite.self_modulate = Global.body_mod
	accsprite.self_modulate = Global.acc_mod
	eyessprite.self_modulate = Global.eyes_mod
	clothessprite.self_modulate = Global.clothes_mod
	#----------------------------------------------------------------
	# make sure no animation is playing
	$sprite/AnimationPlayer.pause()
	#----------------------------------------------------------------

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

func _process(_delta):
#	checks if attacking
	if playerAlive:
		attackAction()
#----------------------------------------------------------------
	
#	adds old mario style hit animation
	if !$invframes.is_stopped():
		invable+= 1
		if invable % 2 == 0:
			self.modulate = "ffffffff"
		else:
			self.modulate = "ffffff00"
#----------------------------------------------------------------
			
#	gains EXP from global script
	if Global.EXPToAdd > 0:
		gain_experience(Global.EXPToAdd)
		Global.EXPToAdd = 0
#----------------------------------------------------------------


func _physics_process(delta):
#	attack timer
	if $attackTimer.time_left <= 0:
		attack = false
#----------------------------------------------------------------

#	player movement
	if playerAlive:
		playerMovement(delta)
#----------------------------------------------------------------

#	death tracker
	if health <=0:
		health = 0
		playerAlive = false
		get_tree().change_scene_to_file("res://scenes/title.tscn")
#----------------------------------------------------------------

func playerMovement(_delta):
	if !attack and !chatting:
		if Input.is_action_pressed("right"):

			current_dir = "right"
			play_anim(1)
			velocity.x = speed
			velocity.y = 0
		elif Input.is_action_pressed("left"):
			current_dir = "left"

			play_anim(1)
			velocity.x = -speed
			velocity.y = 0
		elif Input.is_action_pressed("down"):
			current_dir = "down"

			play_anim(1)
			velocity.x = 0
			velocity.y = speed
		elif Input.is_action_pressed("up"):
			current_dir = "up"

			play_anim(1)
			velocity.x = 0
			velocity.y = -speed
		else:
			play_anim(0)
			velocity.x = 0
			velocity.y = 0
		move_and_slide()
		Global.posx = position.x
		Global.posy = position.y
		if(Input.is_action_pressed("attack")):
			play_anim(2)
	healthUpdate()
	
func play_anim(m): #animations
	var dir = current_dir
	var anim = $sprite/AnimationPlayer
	if  m == 0:
		anim.stop()
		anim.seek(0,true)
	if dir == "right":
		if m == 1:
			anim.play("right walk")
	if dir == "left":
			if m == 1:
				anim.play("left walk")
	if dir == "down":
			if m == 1:
				anim.play("front walk")
	if dir == "up":
			if m == 1:
				anim.play("back walk")


func attackAction():
	if Input.is_action_just_pressed("attack"):
		$combatTimer.start()
		Global.playerAttacting = true
		attack = true
		var anim = $sprite/AnimationPlayer
		$Swingsound.play()
		if current_dir == "right":
			anim.play("right attack")
			$attackTimer.start()
		if current_dir == "left":
			anim.play("left attack")
			$attackTimer.start()
		if current_dir == "down":
			anim.play("front attack")
			$attackTimer.start()
		if current_dir == "up":
			anim.play("back attack")
			$attackTimer.start()

#checks for if a enemy hits player
func enemy_attack(hit):
	if damageable:
		damageable = false
		health_changed.emit(health-hit,-hit)
		$Hitsound.play()
		health -= hit
		$combatTimer.start()
		$invframes.start()


#	stops players attack
func _on_attack_timer_timeout():
	$attackTimer.stop()
	Global.playerAttacting = false
	attack = false

func healthUpdate():
	if maxhealth != health:
		if !healingStart:
			healthregin()

# starts healing
func _on_combat_timer_timeout():
	if !healingStart:
		$combatTimer.start()
	healingStart = true

#	out of combat timer
func healthregin():
	$outOfCombatHeal.start()
	
	
# healing func
func _on_out_of_combat_heal_timeout():
	if health != maxhealth:
		health_changed.emit(health+5,5)
		health += 5
		if health > maxhealth:
			health = maxhealth
			health_changed.emit(maxhealth,5)
	else:
		$outOfCombatHeal.stop()
		healingStart = false
		
	





# checks for if you hit something
func _on_weapon_body_entered(body):
	if body.is_in_group("Enemy"):
		body.hit(damage)

# stops mario style hit animation
func _on_invframes_timeout():
	$invframes.stop()
	damageable = true
	invable	= 0
	self.modulate = "FFFFFFFF"

func collect(item):
	inv.insert(item)
#----------------------------------------------------------------

#Checks for when chatting and when not chatting

func _on_starter_town_chat_done():
	chatting = false


func _on_starter_town_chat_start():
	chatting = true



#end of script
