extends ColorRect

func _on_play_button_pressed():
	get_tree().change_scene_to_file("res://main/levels/level1/Level1.tscn")


#Unimplemented
func _on_tutorial_button_pressed():
	pass
#	get_tree().change_scene_to_file("")
