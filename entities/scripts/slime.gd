extends CharacterBody2D
var speed = 100 
var current_dir
var enemyDetected = false
var enemy = null

var damage = 5
var health = 40
var inAttackRange = false 

var inCooldown = false
var startedTimer = false
var damageable = true
var invable = 0

var following = false


func _ready():
	$AnimatedSprite2D.play("idle")
	add_to_group("Enemy")
	self.y_sort_enabled = true

func _process(_delta):
	if !$invFrames.is_stopped():
		invable+= 1
		if invable % 2 == 0:
			self.modulate = "ffffffff"
		else:
			self.modulate = "ffffff00"



func _on_dealthtimer_timeout():
	Global.EXPToAdd += 5
	self.queue_free()
	
# testing 

# end testing

func _physics_process(_delta):
	healthUpdate()
	if health <= 0:
		$AnimatedSprite2D.play("dealth")
	else:
		
		if inCooldown == true && !startedTimer:
			$attackCooldown.start()
			startedTimer = true
		
		
		
		if enemyDetected:
			following = true
			if $invFrames.is_stopped():
				velocity = (position.direction_to(enemy.position) * speed)*abs((self.position-enemy.position)/90)
			else:
				velocity = (position.direction_to(enemy.position) * speed)*abs((self.position-enemy.position)/190)
			$AnimatedSprite2D.play("jump")
			if(enemy.position.x - position.x) < 0:
				$AnimatedSprite2D.flip_h = true
			else:
				$AnimatedSprite2D.flip_h = false
		else:
			following = false
			$AnimatedSprite2D.play("idle")
			velocity *= 0
	move_and_slide()


func _on_detection_body_entered(body):
	enemy = body
	enemyDetected = true


func _on_detection_body_exited(_body):
	enemy = null
	enemyDetected = false

	

func hit(damage):
	if damageable:
		Global.showDamage(get_tree().get_root(),damage,position)
		damageable = false
		$invFrames.start()
		health -= damage
		if health <= 0:
			health = 0
			$dealthtimer.start() 
			


func enemy_check():
	pass


func _on_attack_cooldown_timeout():
	inCooldown = false
	startedTimer = true
	if globalbody != null:
		_on_hurtbox_body_entered(globalbody)



func _on_inv_frames_timeout():
	damageable = true
	$invFrames.stop()
	self.modulate = "ffffffff"
	invable = 0

func healthUpdate():
	var healthbar = $healthbar
	healthbar.value = health
	if 40 == health:
		healthbar.visible = false
	else:
		healthbar.visible = true

var globalbody
 
func _on_hurtbox_body_entered(body):
	if body.is_in_group("Player"):
		globalbody = body
		if $invFrames.is_stopped():
			body.enemy_attack(damage)
		inCooldown = true


func _on_hurtbox_body_exited(body):
	if body.is_in_group("Player"):
		globalbody = null

func _on_animated_sprite_2d_animation_looped():
	if following:
		$JumpSound.play()
	else:
		$JumpSound.stop()
