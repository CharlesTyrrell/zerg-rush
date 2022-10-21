extends KinematicBody2D

enum {
	U, R, D, L
}

const ACCELERATION = 10
const MOVE_SPEED = 10
const FRICTION = 5
const move_time_step = 60
const move_time_start = move_time_step*2
const move_time_iter = move_time_step 


var vel_mag : float = 0.0
var snap = load("res://global/StaticValues.gd").CELL_LENGTH
var move_dir : int
var timer : int

export (int) var speed = 200
var velocity : Vector2 = Vector2.ZERO

func get_input():
	velocity = Vector2()
	if Input.is_action_pressed("ui_right"):
		velocity.x += 1
	if Input.is_action_pressed("ui_left"):
		velocity.x -= 1
	if Input.is_action_pressed("ui_down"):
		velocity.y += 1
	if Input.is_action_pressed("ui_up"):
		velocity.y -= 1
	velocity = velocity.normalized() * speed

func _physics_process(delta):
	get_input()
	velocity = move_and_slide(velocity)






#func _process(_delta):
#	timer += 1
#
#	if Input.is_action_pressed("ui_right"):
#		if Input.is_action_just_pressed("ui_right"):
#			position.x += snap
#			$Sprite.flip_h = false
#
#			timer = 1
#
#		if(timer > move_time_start && timer % move_time_iter == 0):
#			position.x += snap
#
#	if Input.is_action_pressed("ui_left"):
#		if Input.is_action_just_pressed("ui_left"):
#			position.x -= snap
#			$Sprite.flip_h = true
#
#			timer = 1
#
#		if(timer > move_time_start && timer % move_time_iter == 0):
#			position.x -= snap
#
#	if Input.is_action_pressed("ui_down"):
#		if Input.is_action_just_pressed("ui_down"):
#			position.y += snap
#
#			timer = 1
#
#		if(timer > move_time_start && timer % move_time_iter == 0):
#
#			position.y += snap
#
#	if Input.is_action_pressed("ui_up"):
#		if Input.is_action_just_pressed("ui_up"):
#			position.y -= snap
#
#			timer = 1
#		if(timer > move_time_start && timer % move_time_iter == 0):
#
#			position.y -= snap





#func get_input():
#	look_at(get_global_mouse_position())
#	velocity = Vector2()
#	if Input.is_action_pressed("ui_left"):#ui_down
#		velocity = Vector2(-speed, 0).rotated(rotation)
#		$Sprite.flip_h = true
#	if Input.is_action_pressed("ui_right"):#ui_up
#		velocity = Vector2(speed, 0).rotated(rotation)
#		$Sprite.flip_h = false
#	if Input.is_action_pressed("ui_up"):#ui_left
#		velocity = Vector2(0, -speed).rotated(rotation)
#	if Input.is_action_pressed("ui_down"):#ui_right
#		velocity = Vector2(0, speed).rotated(rotation)
#
#
#
#func _physics_process(delta):
#	get_input()
#	velocity = move_and_slide(velocity)
