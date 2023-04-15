extends KinematicBody2D


class_name KinematicEntity


export (float) var speed = 5
export (Vector2) var velocity = Vector2.ZERO


func _physics_process(delta):
	get_input()
	check_actions()
	velocity = move_and_slide(velocity)


func get_input():
	pass

func check_actions():
	pass
