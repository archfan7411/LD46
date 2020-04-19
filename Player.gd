extends KinematicBody2D


var speed = 50

func _physics_process(delta):
	if Input.is_action_just_pressed("up"):
		self.translate(Vector2(0, -speed))
	elif Input.is_action_just_pressed("down"):
		self.translate(Vector2(0, speed))
	elif Input.is_action_just_pressed("left"):
		self.translate(Vector2(-speed, 0))
	elif Input.is_action_just_pressed("right"):
		self.translate(Vector2(speed, 0))
