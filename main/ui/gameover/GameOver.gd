extends CanvasLayer

@onready var retry_button = $CenterContainer/PanelContainer/VBoxContainer/RetryButton
@onready var quit_button = $CenterContainer/PanelContainer/VBoxContainer/QuitButton

func _ready():
	retry_button.disabled = true
	quit_button.disabled = true


func _on_retry_button_pressed():
	get_tree().reload_current_scene()


func activate():
	retry_button.disabled = false
	quit_button.disabled = false
	$AnimationPlayer.play("gameover")
	Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
