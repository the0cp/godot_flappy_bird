class_name FileHelper

static func save_encrypted(path,data,key):
	var file = File.new()
	file.open_encrypted_with_pass(path,File.WRITE,key)
	file.store_string(var2str(data))
	file.close()

static func read_encrypted(path,key,default_data):
	var data = default_data
	var file = File.new()
	file.open_encrypted_with_pass(path,File.READ_WRITE,key)
	var content :String = file.get_as_text()
	if not content.empty():
		data = str2var(content)
	file.close()
	return data
