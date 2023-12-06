extends CharacterBody2D

@export var speed = 400
@export var Projectile : PackedScene
@export var lives = 3
@export var is_alive = true
@export var enemy_collision_masks = [4]
var invincible = false
signal player_death


# Builtins

func _physics_process(_delta):
	get_input()
	move_and_slide()
	handle_collisions()


func _unhandled_input(event):
	if event.is_action_pressed("ui_cancel"):
		$PauseMenu.pause()


#Signals

func _on_flicker_timer_timeout():
	$PlayerSprite.visible = not $PlayerSprite.visible


func _on_invincibility_timer_timeout():
	invincible = false
	$FlickerTimer.stop()
	$PlayerSprite.visible = true
	set_enemy_collision(true)

func _on_win_area_win():
	print("you win")


#Custom

func get_input():
	if is_alive:
		look_at(get_global_mouse_position())
		if Input.is_action_just_released("shoot"):
			$ShootCooldownTimer.stop()
		elif Input.is_action_pressed("shoot") and $ShootCooldownTimer.is_stopped():
			shoot()	
		if Input.is_action_just_pressed("teleport"):
			teleport_to_target()
		var input_direction = Input.get_vector("left", "right", "up", "down")
		velocity = input_direction * speed


func handle_collisions():
	for index in get_slide_collision_count():
		var collision = get_slide_collision(index)
		if collision.get_collider() is Enemy:
			hit()
		elif collision.get_collider() is WinArea:
			win()


func hit():
	if invincible:
		return
	$HUD.set_life_visibility(lives, false)
	lives -= 1
	if lives == 0:
		die()
	else:
		invincible = true
		set_enemy_collision(false)
		$PlayerHitSound.play()
		$InvincibilityTimer.start()
		$FlickerTimer.start()


func die():
	is_alive = false
	emit_signal("player_death")
	$GameOver.activate()
	$PlayerDeathSound.play()
	$PlayerHitbox.set_deferred("disabled", true)
	$Target.visible = false
	$PlayerSprite.visible = false
	$PlayerSprite/PlayerTrail.emitting = false
	$DeathParticles.restart()
	$DeathParticles.emitting = true
	

func win():
	print("you won")


func shoot():
	$ShootSound.play()
	var p = Projectile.instantiate()
	owner.add_child(p)
	p.transform = 	$Tip.global_transform
	$ShootCooldownTimer.start()


func teleport_to_target():
	global_position = $Target.global_position


func collide(body):
	if body.has_method("collide"):
		body.collide(self)


func set_enemy_collision(is_colliding):
	for mask in enemy_collision_masks:
		set_collision_mask_value(mask, is_colliding)


func is_player():
	return true

