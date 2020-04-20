extends Node2D

var speed = 50
var type = "Enemy"

var mv_delta = 0

var directions = [Vector2(1, 0), Vector2(0, 1), Vector2(-1, 0), Vector2(0, -1)]
# Enemy starts pounting to the right.
var rot = 0

func get_adjacent_tiles(pos):
	var adjacent = []
	var state = get_parent().get_state()
	for offset in directions:
		var test_pos = pos + offset
		if test_pos.y < 0 or test_pos.y > len(state.level_map) - 1:
			continue
		elif test_pos.x < 0 or test_pos.x > len(state.level_map[0]) - 1:
			continue
		elif state.get_type(test_pos) != "Empty":
			continue
		else:
			adjacent.append(test_pos)
	return adjacent
	
func make_dist_tree():
	var dist_tree = {get_pos(): 0}
	var to_check = [get_pos()]
	var dist = 1
	while true:
		var next_to_check = []
		for pos in to_check:
			var adjacent = get_adjacent_tiles(pos)
			for adj_pos in adjacent:
				if adj_pos in dist_tree:
					continue
				dist_tree[adj_pos] = dist
				next_to_check.append(adj_pos)
		if len(next_to_check) == 0:
			return dist_tree
		to_check = next_to_check
		dist += 1

func pathfind(player_pos):
	var dist_tree = make_dist_tree()
	if not player_pos in dist_tree:
		# The player cannot be reached.
		return null
	var last_dist = dist_tree[player_pos]
	var path = [player_pos]
	while true:
		for adj_pos in get_adjacent_tiles(path[-1]):
			if adj_pos == get_pos():
				return path
			if dist_tree[adj_pos] < last_dist:
				last_dist -= 1
				path.append(adj_pos)
				
func follow_wall(player_pos):
	var state = get_parent().get_state()
	var mv_offset = null
	var my_pos = get_pos()
	while true:
		var side_offset = directions[rot - 1]
		var ahead_offset = directions[rot]
		var side_tile = state.get_type(my_pos + side_offset)
		var ahead_tile = state.get_type(my_pos + ahead_offset)
		if side_tile == "Empty" or not ahead_tile == "Empty":
			rot += 1
			if rot >= 4:
				rot = 0
			return null
		else:
			return ahead_offset
		
func _physics_process(delta):
	mv_delta += delta
	if mv_delta >= 1:
		mv_delta = 0
		var state = get_parent().get_state()
		var player_pos = state.player_pos
		var path = pathfind(Vector2(1, 5))
		if path == null:
			return
		var mv_target = path[-1]
		for offset in directions:
			if get_pos() + offset == mv_target:
				self.translate(offset * Vector2(speed, speed))
				break
		
func get_pos():
	var pos = self.global_position
	pos = Vector2(pos.x/50, pos.y/50)
	return pos
