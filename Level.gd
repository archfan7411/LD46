extends Node2D

var map_desc = {
	" " : preload("res://Obstacle.tscn"),
	"." : preload("res://Obstacle.tscn"),
	"*" : preload("res://Obstacle.tscn"),
	"G" : preload("res://Obstacle.tscn"),
	"P" : preload("res://Obstacle.tscn"),
	"I" : preload("res://Obstacle.tscn"),
	"#" : preload("res://Obstacle.tscn"),
}

func load_level_file(filename):
	var lines = []
	var filestream = File.new()
	filestream.open("res://levels/" + filename, File.READ)
	while not filestream.eof_reached():
		lines.append(filestream.get_line())
	filestream.close()
	for y in range(len(lines)):
		for x in range(len(lines[0])):
			var tile_str = lines[y][x]
			var new_instance = map_desc[tile_str].instance()
			new_instance.global_position = Vector2(x * 3000, y * 3000)
			self.add_child(new_instance)

# This doesn't seem to work, please fix.
func _ready():
	load_level_file("test_level_2.txt")
