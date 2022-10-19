extends Node2D



var snap = load("res://global/StaticValues.gd").CELL_LENGTH


func _ready():
	pass
	
	

func _process(delta):
	if Input.is_action_just_pressed("ui_right"):
		position.x += snap
		$Sprite.flip_h = false
	if Input.is_action_just_pressed("ui_left"):
		position.x -= snap
		$Sprite.flip_h = true
	if Input.is_action_just_pressed("ui_down"):
		position.y += snap
	if Input.is_action_just_pressed("ui_up"):
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
