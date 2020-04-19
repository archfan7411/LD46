extends Node2D

var map_desc = {
	" " : preload("res://Empty.tscn"), # empty
	"." : preload("res://Dirt.tscn"), # dirt
	"*" : preload("res://Rock.tscn"), # rock
	"G" : preload("res://Goal.tscn"), # goal
	"P" : preload("res://Player.tscn"), # Player
	"I" : preload("res://Enemy.tscn"), # Enemy
	"#" : preload("res://Wall.tscn"), # wall
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
			new_instance.global_position = Vector2(x * 50, y * 50)
			self.add_child(new_instance)

# This doesn't seem to work, please fix.
func _ready():
	load_level_file("test_level_2.txt")
