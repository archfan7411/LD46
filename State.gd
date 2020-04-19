extends Node

var level_map = null
var player = null
var enemy = null
var player_speed = 50

var player_pos = Vector2()
var enemy_pos = Vector2()

func _init(lvlmap, plr, enm):
	level_map = lvlmap
	player = plr
	enemy = enm

func get_type(pos):
	print(level_map[pos.y][pos.x].type)
	return level_map[pos.y][pos.x].type
