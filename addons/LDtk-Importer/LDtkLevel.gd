extends Node2D

class_name LDtkLevel

var map_root : Node
export var identifier : String
export var uid : int
export var world_pos : Vector2
export var px_size : Vector2
export var bg_color : Color
export var layer_instances : Array
export var __neighbours : Array

func _init(d:Dictionary = {}):
	if d.empty():
		push_warning("level data is empty - please pass it to new()")
		return
	identifier = d.identifier
	uid = d.uid
	world_pos = Vector2(d.worldX, d.worldY)
	px_size = Vector2(d.pxWid, d.pxHei)
	if d.get("bgColor") != null:
		bg_color = Color(d.bgColor as String)
	else:
		bg_color = Color(d.__bgColor as String)
	
	layer_instances = d.layerInstances
	__neighbours = d.__neighbours
	
	name = identifier
	position = world_pos
	
#	for layer in layer_instances:
#		load_layer(layer)


#func load_layer(d:Dictionary):
#	var instance
#	match d.__type:
#		"IntGrid":
#			instance = load_intGrid(d)
#		_:
#			instance = LDtkLayerInstance.new(d)
#	add_child(instance)
#	instance.owner = map_root
#
#func load_intGrid(d:Dictionary):
#	print("yolo")
#	var instance = LDtkIntGrid.new(d)
#	return instance
