class_name WinArea
extends RigidBody2D

func _ready():
	gravity_scale = Gravity.gravity_scale
	mass = Gravity.mass
	linear_velocity = Gravity.linear_velocity
