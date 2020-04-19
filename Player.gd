extends KinematicBody2D

var speed = 50
var type = "Player"

func _physics_process(_delta):
	var state = get_parent().get_state()
	var holding_ctrl = Input.is_action_just_pressed("dig")
	if Input.is_action_just_pressed("up"):
		var pos = self.get_pos()
		pos = Vector2(pos.x, pos.y-1)
		if state.get_type(pos) == "Empty":
			self.translate(Vector2(0, -speed))
	elif Input.is_action_just_pressed("down"):
		var pos = self.get_pos()
		pos = Vector2(pos.x, pos.y+1)
		if state.get_type(pos) == "Empty":
			self.translate(Vector2(0, speed))
	elif Input.is_action_just_pressed("left"):
		var pos = self.get_pos()
		pos = Vector2(pos.x-1, pos.y)
		if state.get_type(pos) == "Empty":
			self.translate(Vector2(-speed, 0))
	elif Input.is_action_just_pressed("right"):
		var pos = self.get_pos()
		pos = Vector2(pos.x+1, pos.y)
		if state.get_type(pos) == "Empty":
			self.translate(Vector2(speed, 0))

func get_pos():
	var pos = self.global_position
	pos = Vector2(pos.x/50, pos.y/50)
	return pos
