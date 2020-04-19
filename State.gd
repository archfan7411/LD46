extends Node

var level_map = null
var player = null
var player_speed = 50

# Broken, idk how to do this.
var empty_node = preload("res://Empty.tscn")
var dirt_node = preload("res://Dirt.tscn")
var rock_node = preload("res://Rock.tscn")
var wall_node = preload("res://Obstacle.tscn")
var goal_node = preload("res://Goal.tscn")
var enemy_node = preload("res://Enemy.tscn")

func _init(lvlmap, plr):
	level_map = lvlmap
	player = plr
	
func move():
	# TODO Calculate player position.
	var x = 0
	var y = 0
	var node_type = level_map[y][x]
	# Broken.
	if node_type is empty_node:
		if Input.is_action_just_pressed("up"):
			player.translate(Vector2(0, -player_speed))
		elif Input.is_action_just_pressed("down"):
			player.translate(Vector2(0, player_speed))
		elif Input.is_action_just_pressed("left"):
			player.translate(Vector2(-player_speed, 0))
		elif Input.is_action_just_pressed("right"):
			player.translate(Vector2(player_speed, 0))
	elif node_type is dirt_node:
		pass
	elif node_type is rock_node:
		pass
	elif node_type is wall_node:
		pass
	elif node_type is goal_node:
		pass
	elif node_type is enemy_node:
		pass
