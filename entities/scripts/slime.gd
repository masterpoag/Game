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

func _ready():
	$AnimatedSprite2D.play("idle")
	add_to_group("Enemy")

func _process(delta):
	if !$invFrames.is_stopped():
		invable+= 1
		if invable % 2 == 0:
			self.modulate = "ffffffff"
		else:
			self.modulate = "ffffff00"



func _on_dealthtimer_timeout():
	self.queue_free()
	
# testing 

# end testing

func _physics_process(delta):
	healthUpdate()
	if health <= 0:
		$AnimatedSprite2D.play("dealth")
	else:
		
		if inCooldown == true && !startedTimer:
			$attackCooldown.start()
			startedTimer = true
		
		
		
		if enemyDetected:
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
			$AnimatedSprite2D.play("idle")
			velocity *= 0
	move_and_slide()


func _on_detection_body_entered(body):
	enemy = body
	enemyDetected = true


func _on_detection_body_exited(body):
	enemy = null
	enemyDetected = false

	

func hit(damage):
	if damageable:
		damageable = false
		$invFrames.start()
		health -= damage
		print("slime health is at "+str(health))
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
