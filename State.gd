extends Node

var level_map = null
var player = null
var player_speed = 50

func _init(lvlmap, plr):
	level_map = lvlmap
	player = plr

func get_type(pos):
	print(level_map[pos.y][pos.x].type)
	return level_map[pos.y][pos.x].type
