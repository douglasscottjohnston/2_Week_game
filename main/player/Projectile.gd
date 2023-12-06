extends Area2D

@export var speed = 750

func _physics_process(delta):
	position += transform.x * speed * delta


func _on_area_entered(area):
	if area.has_method("hit"):
		area.hit()
	queue_free()


func _on_body_entered(body):
	if body.has_method("hit"):
		body.hit()
		queue_free()
