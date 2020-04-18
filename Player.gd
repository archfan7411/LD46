extends KinematicBody2D

var speed = 100

func _physics_process(delta):
	if Input.is_action_pressed("up"):
		self.move_and_slide(Vector2(0, -speed))
	if Input.is_action_pressed("down"):
		self.move_and_slide(Vector2(0, speed))
	if Input.is_action_pressed("left"):
		self.move_and_slide(Vector2(-speed, 0))
	if Input.is_action_pressed("right"):
		self.move_and_slide(Vector2(speed, 0))
