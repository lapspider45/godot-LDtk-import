tool
extends EditorImportPlugin


func get_importer_name():
	return "LDtk.import"


func get_visible_name():
	return "LDtk Importer"


func get_recognized_extensions():
	return ["ldtk"]


func get_save_extension():
	return "tscn"

func get_resource_type():
	return "PackedScene"

func get_preset_count():
	return 1


func get_preset_name(preset):
	return "Default"


func get_import_options(preset):
	return []

func import(source_file, save_path, options, platform_v, r_gen_files):
	#load LDtk map
	var ldtk = LDtk.new()
	ldtk.source_filepath = source_file.get_base_dir()
	ldtk.import(source_file)
	var packed_scene = PackedScene.new()
	packed_scene.pack(ldtk.map)
	
	ResourceSaver.save("testmap.%s" % get_save_extension(), packed_scene)
	return ResourceSaver.save("%s.%s" % [save_path, get_save_extension()], packed_scene)
