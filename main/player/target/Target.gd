extends Marker2D


func _ready():
	Input.mouse_mode = Input.MOUSE_MODE_CONFINED_HIDDEN
	global_position = get_global_mouse_position()
	

func _process(_delta):
	global_position = get_global_mouse_position()
