extends CanvasLayer

signal win_animation_done

func _ready():
	# need to do this to get the length of the animation programmatically
	$AnimationPlayer.current_animation = "fade_in_and_out"
	$AnimationTimer.wait_time = $AnimationPlayer.current_animation_length
	$AnimationPlayer.current_animation = ""


func start_animation():
	$AnimationPlayer.play("fade_in_and_out")
	$AnimationTimer.start()


func _on_animation_timer_timeout():
	win_animation_done.emit()


