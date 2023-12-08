class_name Enemy
extends RigidBody2D

@export var points = 5

# Called when the node enters the scene tree for the first time.
func _ready():
	gravity_scale = Gravity.gravity_scale
	mass = Gravity.mass
	linear_velocity = Gravity.linear_velocity


func hit():
	Score.score += points
	# need to do this so the partilce effect will play
	$CollisionShape2D.set_deferred("disabled", true)
	$Sprite2D.visible = false
	$DeathParticles.restart()
	$DeathParticles.emitting = true
	$AudioStreamPlayer2D.play()
