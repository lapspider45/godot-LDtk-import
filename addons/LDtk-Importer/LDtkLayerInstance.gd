extends Node # only temporarily a Node

class_name LDtkLayerInstance

# common fields for all types
export var identifier : String
export var layer_def_uid : int
#export var level_id : int # should match get_parent().uid
enum TYPES {IntGrid, Entities, Tiles, AutoLayer, Unknown = -1}
const types_lookup = ["IntGrid", "Entities", "Tiles", "AutoLayer"]
export(TYPES) var type: int
export var cell_size : Vector2 # __cHei and __cWid
export var grid_size : int
export var opacity : float
export var offset : Vector2 # __pxOffset
export var total_offset : Vector2 # __pxTotalOffset

func _init(d:Dictionary = {}):
#	print(d)
	if d.empty():
		push_warning("layerInstance data is empty - please pass it to new()")
		return
	identifier = d.__identifier
	layer_def_uid = d.layerDefUid
	
	cell_size = Vector2(d.__cWid, d.__cHei)
	grid_size = d.__gridSize
	opacity = d.__opacity
	offset = Vector2(d.pxOffsetX, d.pxOffsetY)
	total_offset = Vector2(d.__pxTotalOffsetX, d.__pxTotalOffsetY)
	
	type = types_lookup.find(d.__type)
	match type:
		TYPES.Entities:
			pass
		TYPES.Tiles, TYPES.IntGrid, TYPES.AutoLayer:
			pass
	
	name = identifier
