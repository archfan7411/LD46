extends Node

const SPACE = 50

var rock = preload("res://Rock.tscn")
var empty = preload("res://Empty.tscn")

var level_map = null
var player = null
var enemy = null

var player_pos = Vector2()
var enemy_pos = Vector2()

func _init(lvlmap, plr, enm):
	level_map = lvlmap
	player = plr
	enemy = enm

func get_type(pos):
	print(level_map[pos.y][pos.x].type)
	return level_map[pos.y][pos.x].type

# We only expect having to set Empty and Rock types
func set_pos(pos, type):
	if type == "Rock":
		level_map[pos.y][pos.x].queue_free()
		var instance = rock.instance()
		level_map[pos.y][pos.x] = instance
		instance.global_position = Vector2(pos.x*SPACE, pos.y*SPACE)
	elif type == "Empty":
		level_map[pos.y][pos.x].queue_free()
		var instance = empty.instance()
		level_map[pos.y][pos.x] = instance
		instance.global_position = Vector2(pos.x*SPACE, pos.y*SPACE)
	