extends CanvasLayer


func _process(_delta):
	$Score.text = str(Score.score)


func set_life_visibility(life : int, visibility : bool):
	_get_life(life).visible = visibility
	print("life" + str(life) + " invisible")


func _get_life(life : int) -> TextureRect:
	match(life):
		2:
			return $MarginContainer/HBoxContainer/Life2
		3:
			return $MarginContainer/HBoxContainer/Life3
		_:
			return $MarginContainer/HBoxContainer/Life1
