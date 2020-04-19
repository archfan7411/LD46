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
	var holding_ctrl = Input.is_action_just_pressed("dig")
	for input in dir_offsets:
		if Input.is_action_just_pressed(input):
			var offset = dir_offsets[input]
			var mv_target = get_pos() + offset
			if state.get_type(mv_target) == "Empty":
				self.translate(offset * Vector2(speed, speed))
			state.player_pos = get_pos()

func get_pos():
	var pos = self.global_position
	pos = Vector2(pos.x/50, pos.y/50)
	return pos
