extends KinematicBody2D

var speed = 50
var type = "Player"

var dir_offsets = {
	"up" : Vector2(0, -1),
	"down" : Vector2(0, 1),
	"left" : Vector2(-1, 0),
	"right" : Vector2(1, 0),
}

func _physics_process(_delta):
	var state = get_parent().get_state()
	var digging = Input.is_action_pressed("dig")
	for input in dir_offsets:
		if Input.is_action_just_pressed(input):
			var offset = dir_offsets[input]
			var mv_target = get_pos() + offset
			var old_pos = get_pos()
			if state.get_type(mv_target) == "Empty":
				self.translate(offset * Vector2(speed, speed))
				var new_pos = get_pos()
				state.move(old_pos, new_pos)
			elif state.get_type(mv_target) == "Dirt" and not digging:
				self.translate(offset * Vector2(speed, speed))	
				var new_pos = get_pos()
				state.move(old_pos, new_pos)
			elif state.get_type(mv_target) == "Dirt" and digging:
				state.clear_tile(mv_target)
			elif state.get_type(mv_target) == "Goal":
				get_tree().change_scene("res://EndGame.tscn")
			state.player_pos = get_pos()

func get_pos():
	var pos = self.global_position
	pos = Vector2(pos.x/50, pos.y/50)
	return pos
