extends Node2D

var speed = 50
var type = "Enemy"

var mv_delta = 0

func choose_move_offset(player_pos):
	var state = get_parent().get_state()
	var mv_offset = null
	var my_pos = get_pos()
	var delta_x = player_pos.x - my_pos.x
	var delta_y = player_pos.y - my_pos.y
	if abs(delta_x) > abs(delta_y):
		if delta_x > 0:
			mv_offset = Vector2(1, 0)
		else:
			mv_offset = Vector2(-1, 0)
	else:
		if delta_y > 0:
			mv_offset = Vector2(0, 1)
		else:
			mv_offset = Vector2(0, -1)

	var mv_target = my_pos + mv_offset
	if state.get_type(mv_target) == "Empty":
		return mv_offset
	else:
		# TODO follow a wall.
		pass
		
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
