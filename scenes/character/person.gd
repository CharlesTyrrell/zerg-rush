extends Node2D

enum {
	U, R, D, L
}

const move_time_step = 60
const move_time_start = move_time_step*2
const move_time_iter = move_time_step 

var snap = load("res://global/StaticValues.gd").CELL_LENGTH
var move_dir : int
var timer : int

func _process(_delta):
	timer += 1
	
	
	
	if Input.is_action_pressed("ui_right"):
		if Input.is_action_just_pressed("ui_right"):
			position.x += snap
			$Sprite.flip_h = false
			
			timer = 1
		
		if(timer > move_time_start && timer % move_time_iter == 0):
			position.x += snap
	
	if Input.is_action_pressed("ui_left"):
		if Input.is_action_just_pressed("ui_left"):
			position.x -= snap
			$Sprite.flip_h = true
			
			timer = 1
		
		if(timer > move_time_start && timer % move_time_iter == 0):
			position.x -= snap
	
	if Input.is_action_pressed("ui_down"):
		if Input.is_action_just_pressed("ui_down"):
			position.y += snap
			
			timer = 1
		
		if(timer > move_time_start && timer % move_time_iter == 0):
			
			position.y += snap
	
	if Input.is_action_pressed("ui_up"):
		if Input.is_action_just_pressed("ui_up"):
			position.y -= snap
			
			timer = 1
		if(timer > move_time_start && timer % move_time_iter == 0):
			
			position.y -= snap





#
#func _unhandled_input(event):
#
#	if event is event.pressed:
#			match event.scancode:
#				KEY_ESCAPE:
#					get_tree().quit()
#				MOVE_LEFT:
#					position.x -= snap
#				MOVE_RIGHT:
#					position.x += snap
#				MOVE_DOWN:
#					position.y += snap
#				MOVE_UP:
#					position.y -= snap
#
