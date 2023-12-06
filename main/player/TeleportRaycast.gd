extends RayCast2D

# The ray always points twards the mouse and only colides with the world boundry

func _process(_delta):
	target_position = get_global_mouse_position()
