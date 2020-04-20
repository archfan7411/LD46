extends Node2D

var speed = 50
var type = "Enemy"

var mv_delta = 0

var directions = [Vector2(1, 0), Vector2(0, 1), Vector2(-1, 0), Vector2(0, -1)]
# Enemy starts pounting to the right.
var rot = 0

func choose_move_offset(player_pos):
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
		var mv_offset = choose_move_offset(player_pos)
		if not mv_offset == null:
			self.translate(mv_offset * Vector2(speed, speed))
		
func get_pos():
	var pos = self.global_position
	pos = Vector2(pos.x/50, pos.y/50)
	return pos
