extends Node

var _level_file_paths = ["res://main/levels/level1/Level1.tscn", "res://main/levels/level1/Level1.tscn"]
var _main_menu_path = "res://main/ui/mainmenu/MainMenu.tscnres://main/ui/mainmenu/MainMenu.tscn"
var _current_level = 0


## Returns the file path of the current level.
func current() -> String:
	return _level_file_paths[_current_level]


## Returns the filepath to the next level and sets it to the current level.
## If there isn't a next level it will set the current level to the
## first level and return the main menu file path.
func next() -> String:
	_current_level += 1
	if _current_level >= len(_level_file_paths):
		_current_level = 0
		return _main_menu_path
	return _level_file_paths[_current_level]


## Returns the filepath to the previous level and sets it to the current level.
## If there isn't a previous level it will return the current level.
func previous() -> String:
	_current_level -= 1
	if _current_level < 0:
		_current_level = 0
	return _level_file_paths[_current_level]
