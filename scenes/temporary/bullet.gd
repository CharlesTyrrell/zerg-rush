extends Node2D


class_name Bullet

const LIFETIME : float = 6.0 #in meters
const SPEED : float = 20.0 # in m/s


var direction : Vector2 = Vector2.UP
var timer: Timer = Timer.new()

#
func _init(position : Vector2, direction : Vector2):
	self.global_position = position
	self.direction = direction.normalized() * SPEED
	self.z_index = 12

func _ready():
	var texture = load("res://assets/sprites/bullet.png")
	var sprite = Sprite.new()
	sprite.texture = texture
	add_child(sprite)
	add_child(timer)
	timer.connect("timeout", self, "queue_free")
	timer.start(LIFETIME/SPEED)
	print("Hello")
	set_as_toplevel(true)

func _physics_process(delta):
	global_position.x += direction.x * SPEED * delta
	global_position.y += direction.y * SPEED * delta

