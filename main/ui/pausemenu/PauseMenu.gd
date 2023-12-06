extends ColorRect

@onready var resume_button = $CenterContainer/PanelContainer/MarginContainer/VBoxContainer/ResumeButton

func _ready():
	resume_button.pressed.connect(unpause)


func pause():
	$AnimationPlayer.play("pause")
	get_tree().paused = true
	Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
	

func unpause():
	print("unpause")
	$AnimationPlayer.play("unpause")
	get_tree().paused = false
	Input.mouse_mode = Input.MOUSE_MODE_CONFINED_HIDDEN
	
