var map_desc = {
	" " : preload("res://Obstacle.tscn"),
	"." : preload("res://Obstacle.tscn"),
	"*" : preload("res://Obstacle.tscn"),
	"G" : preload("res://Obstacle.tscn"),
	"P" : preload("res://Obstacle.tscn"),
	"I" : preload("res://Obstacle.tscn"),
}

func load_level_file(filename):
	var lines = []
	var filestream = File.new()
	filestream.open("res://levels/" + filename)
	while not filestream.end_of_file():
		lines.append(filestream.get_line())
	filestream.close()
	for y in range(len(lines)):
		for x in range(len(lines[0])):
			var tile_str = lines[y][x]
			var new_instance = map_desc[tile_str].instance()
			new_instance.Translation = Vector2(x * 3000, y * 3000)
			self.get_root.add_child(new_instance)

# This doesn't seem to work, please fix.
func _on_Level_ready():
	load_level_file("test_level_2.txt")
