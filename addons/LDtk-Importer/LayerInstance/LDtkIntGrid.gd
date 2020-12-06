extends TileMap

class_name LDtkIntGrid

export var identifier : String
export var layer_def_uid : int
export var opacity : float
export var _cell_size : Vector2 # Godot uses this name for tile size
export var offset : Vector2 # __pxOffset
export var total_offset : Vector2 # __pxTotalOffset

func _init(d:Dictionary = {}):
#	print(d)
	if d.empty():
		push_warning("layerInstance data is empty - please pass it to new()")
		return
	identifier = d.__identifier
	layer_def_uid = d.layerDefUid
	
	_cell_size = Vector2(d.__cWid, d.__cHei)
	cell_size = Vector2(d.__gridSize, d.__gridSize)
	opacity = d.__opacity
	offset = Vector2(d.pxOffsetX, d.pxOffsetY)
	total_offset = Vector2(d.__pxTotalOffsetX, d.__pxTotalOffsetY)
	
	
	name = identifier
	modulate.a = opacity
	
	
	# just checking
	tile_set = load("res://test/number_tileset_dbg.tres")


