tool
extends EditorPlugin

var plugin_script = preload("LDtkImporter.gd")
var import_plugin = null


func get_name():
	return "LDtk Importer"


func _enter_tree():
	import_plugin = plugin_script.new()
	add_import_plugin(import_plugin)


func _exit_tree():
	remove_import_plugin(import_plugin)
	import_plugin = null

