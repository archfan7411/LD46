extends KinematicBody2D

# Also grid size
var speed = 3000

func _physics_process(delta):
	if Input.is_action_just_pressed("left"):
		self.move_and_slide(Vector2(-speed, 0))
	elif Input.is_action_just_pressed("right"):
		self.move_and_slide(Vector2(speed, 0))
