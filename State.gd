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

func clear_tile(pos):
	var old_instance = level_map[pos.y][pos.x]
	old_instance.queue_free()
	var new_instance = empty.instance()
	new_instance.global_position = pos * Vector2(SPACE, SPACE)
	level_map[pos.y][pos.x] = new_instance

func move(pos1, pos2):
	var instance1 = level_map[pos1.y][pos1.x]
	var instance2 = level_map[pos2.y][pos2.x]
	instance2.queue_free()
	var new_instance = empty.instance()
	new_instance.global_position = pos1 * Vector2(SPACE, SPACE)
	level_map[pos1.y][pos1.x] = new_instance
	level_map[pos2.y][pos2.x] = instance1

	

# We only expect having to set Empty and Rock types
func set_pos(pos, type):
	if type == "Rock":
		level_map[pos.y][pos.x].queue_free()
		var instance = rock.instance()
		level_map[pos.y][pos.x] = instance
		instance.global_position = Vector2(pos.x*SPACE, pos.y*SPACE)
	elif type == "Empty":
		var instance = empty.instance()
		level_map[pos.y][pos.x].queue_free()
		level_map[pos.y][pos.x] = instance
		instance.global_position = Vector2(pos.x*SPACE, pos.y*SPACE)
		if level_map[pos.y-1][pos.x].type == "Rock":
			level_map[pos.y-1][pos.x].queue_free()
			var instancea = empty.instance()
			level_map[pos.y-1][pos.x].queue_free()
			level_map[pos.y-1][pos.x] = instancea
			set_pos(Vector2(pos.y-1, pos.x), "Empty")
			var current_space = pos.y
			for y in range(pos.y, len(level_map)):
				if level_map[y][pos.x].type != "Empty":
					set_pos(Vector2(pos.x, current_space), "Rock")
				else:
					current_space = y

func _input(event):
	if Input.is_action_just_pressed("restart"):
		get_tree().reload_current_scene()
