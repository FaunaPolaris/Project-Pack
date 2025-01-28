extends CharacterBody2D


const SPEED = 16

func	_process(delta):
	if Input.is_action_just_pressed("ui_up") and !$up.is_colliding():
		position.y -= SPEED
	elif Input.is_action_just_pressed("ui_down") and !$down.is_colliding():
		position.y += SPEED
	elif Input.is_action_just_pressed("ui_left") and !$left.is_colliding():
		position.x -= SPEED
	elif Input.is_action_just_pressed("ui_right") and !$right.is_colliding():
		position.x += SPEED
