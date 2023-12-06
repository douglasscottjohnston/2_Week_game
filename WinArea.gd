class_name WinArea
extends RigidBody2D

signal win

func _ready():
	gravity_scale = Gravity.gravity_scale
	mass = Gravity.mass


func _on_body_entered(body):
	if body.has_method("is_player"):
		print("emmiting")
		emit_signal("win")
