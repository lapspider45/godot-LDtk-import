extends Node2D

class_name LDtkLevel

export var identifier : String
export var uid : int
export var world_pos : Vector2
export var px_size : Vector2
export var bg_color : Color
var layer_instances : Array
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
