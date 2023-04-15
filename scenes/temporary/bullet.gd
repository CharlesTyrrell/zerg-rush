extends KinematicEntity
class_name Bullet

const LIFETIME : float = 100.0 #in meters
var COLLISION = load("res://scenes/temporary/bullet.tscn")

var collision_instance : Area2D
var visible_timer: Timer = Timer.new()
var timer: Timer = Timer.new()
#
func _init(position : Vector2, direction : Vector2):
	self.visible = false

	speed = 200
	velocity = direction.normalized() * speed
	self.z_index = 12
	print("cool")
	



func _ready():
	
	collision_instance = COLLISION.instance()
	add_child(collision_instance)
	timer.connect("timeout", self, "queue_free")
	timer.start(LIFETIME/speed)
	set_as_toplevel(true)
	collision_instance.connect("body_entered", self, "bullet_hit")
	
	add_child(visible_timer)
	visible_timer.connect("timeout", self, "turn_visible")
	visible_timer.start(0.02)
	print("cool2")


func turn_visible():
	self.visible = true

func bullet_hit():
	print("asdfasfdsdf")
	bullet_hit_animation()
	queue_free()

func bullet_hit_animation():
	pass
