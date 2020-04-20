extends Node2D

var type = "Rock"
var speed = 50
var falling = false
var last_mv_delta = 0

func get_fall_offset():
	var state = get_parent().get_state()
	var tile_below = get_pos() + Vector2(0, 1)
	if tile_below.y > len(state.level_map) - 1:
		return null
	if state.get_type(tile_below) == "Empty":
		return Vector2(0, 1)
	var left_tile = get_pos() + Vector2(-1, 0)
	if left_tile.x > 0 and state.get_type(left_tile) == "Empty":
		var tile_left_below = get_pos() + Vector2(-1, 1)
		if state.get_type(tile_left_below) == "Empty":
			return Vector2(-1, 0)
	var right_tile = get_pos() + Vector2(1, 0)
	if right_tile.x < len(state.level_map[0]) - 1 and \
	   state.get_type(right_tile) == "Empty":
		var tile_right_below = get_pos() + Vector2(1, 1)
		if state.get_type(tile_right_below) == "Empty":
			return Vector2(1, 0)
	return null

func _physics_process(delta):
	last_mv_delta += delta
	if last_mv_delta >= 1:
		last_mv_delta = 0
		var fall_offset = get_fall_offset()
		if fall_offset == null:
			falling = false
			return
		falling = true
		var old_pos = get_pos()
		self.translate(fall_offset * Vector2(speed, speed))
		var new_pos = get_pos()
		var state = get_parent().get_state()
		state.move(old_pos, new_pos)

func get_pos():
	var pos = self.global_position
	pos = Vector2(pos.x/50, pos.y/50)
	return pos
