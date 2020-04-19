extends Node2D

const SPACE = 50
const BUFFER = 10

var state = null
var State = load("State.gd")
var Player = load("Player.gd")

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
	var lvl_map = []
	for y in range(len(lines)):
		var row = []
		for x in range(len(lines[0])):
			var tile_str = lines[y][x]
			var new_instance = map_desc[tile_str].instance()
			new_instance.global_position = Vector2(x * SPACE, y * SPACE)
			self.add_child(new_instance)
			row.append(new_instance)
		lvl_map.append(row)
	var plr = Player.new()
	state = State.new(lvl_map, plr)
	OS.window_size = Vector2((len(lines)*SPACE)-BUFFER, (len(lines[0])*SPACE)-BUFFER)

func _ready():
	load_level_file("test_level_2.txt")

func get_state():
	return state
