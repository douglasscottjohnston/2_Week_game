extends TileMap

@export var Brick = preload("res://enemies/enemy_brick/Brick.tscn")
@export var tile_layer = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	load_tiles()
	queue_free()
	

## Adds bricks where a tile has been placed
func load_tiles():
	for tile in get_used_cells(tile_layer):
		var brick = Brick.instantiate()
		owner.add_child.call_deferred(brick)
		brick.global_position = to_global(map_to_local(tile))
		
