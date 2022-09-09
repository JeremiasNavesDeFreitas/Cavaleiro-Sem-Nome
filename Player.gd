extends KinematicBody2D

const UP = Vector2(0, -1)
const GRAVITY = 75
const SPEED = 350
const JUMP_HEIGHT = -1300 
var motion = Vector2()
var moved = false

func _physics_process(_delta):
	motion.y += GRAVITY
	
	if Input.is_action_pressed('ui_right'):
		motion.x = SPEED
		moved = true
		get_node('AnimatedSprite').flip_h = false
	elif Input.is_action_pressed('ui_left'):
		motion.x = -SPEED
		moved = true
		get_node('AnimatedSprite').flip_h = true
	else:
		motion.x=0
		
	if is_on_floor():
		
		if Input.is_action_pressed('ui_up'):
			motion.y = JUMP_HEIGHT
			moved = true
	
	motion = move_and_slide(motion, UP)
	if (moved):
		get_node('AnimatedSprite').play('Andando')
	else:
		get_node("AnimatedSprite").stop()
