extends CanvasLayer


func _on_retry_button_pressed():
	get_tree().reload_current_scene()


func activate():
	$AnimationPlayer.play("gameover")
	Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
