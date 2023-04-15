extends KinematicEntity
#collision layer 1


var timer : int
signal player_dead

func _ready():
	action_snap_camera_pos()
	var main_scene = get_parent()
	print(main_scene)
	connect("player_dead", main_scene, "game_over")









func check_actions():
	action_shoot()
	action_snap_camera_pos()


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








const SHOOT_ITER = 10
const SHOOT_TIME_START = 10

func action_shoot():
	timer += 1
	velocity = move_and_slide(velocity)
	if Input.is_action_pressed("ui_left_click"):
		if Input.is_action_just_pressed("ui_left_click"):
			action_create_bullet()
			timer = 1
		
		if(timer % SHOOT_ITER == 0):
			action_create_bullet()
			
"""
func action_create_bullet():
	var mouse_pos = get_global_mouse_position()
	var new_bullet = Bullet.new(position, Vector2(mouse_pos.x - position.x, mouse_pos.y - position.y)) #bullet_velocity
	add_child(new_bullet)

	print("Bullet shot")

"""
func action_create_bullet():
	var mouse_pos = get_global_mouse_position()
	var new_bullet = Bullet.new(global_position, Vector2(mouse_pos.x - global_position.x, mouse_pos.y - global_position.y)) #bullet_velocity
	add_child(new_bullet)

	print("Bullet shot")

func action_snap_camera_pos():
	$Camera2D.position.x = stepify(position.x, 352) + 8 # stepify(global_position.x, 352) + 8
	$Camera2D.position.y = stepify(position.y, 240) + 8 #stepify(global_position.y, 240) + 8




func _on_hit_from_zombie(area):
	
	print("game over")
	emit_signal("player_dead")
	
