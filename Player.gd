extends KinematicBody2D

var speed = 50

func _physics_process(_delta):
	var state = get_parent().state
	state.move()
