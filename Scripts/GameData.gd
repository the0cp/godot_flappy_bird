extends Node

var score = 0

func update_record():
	if score > load_record():
		FileHelper.save_encrypted("user://record.res",score,OS.get_unique_id())

func load_record():
	return FileHelper.read_encrypted("user://record.res",OS.get_unique_id(),0)
