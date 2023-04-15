extends KinematicEntity


# Declare member variables here. Examples

var player
export (int) var health = 3

var on_hit_timer = Timer.new()

func get_player():
	var nodes = get_tree().get_nodes_in_group("player")
	if len(nodes) > 0:
		return nodes[0]
	push_error("The player is missing...")


func _ready():
	player = get_player()
	add_child(on_hit_timer)
	on_hit_timer.one_shot = true
	on_hit_timer.connect("timeout", self, "end_on_hit_animation")


func _init():
	self.speed = (randi() % 15) + 10


func get_input():
	velocity = position.direction_to(player.position).normalized() * speed



func _on_area_entered(area):
	##Assuming this is a bullet
	health -= 1
	on_hit()
	if (health <= 0):
		queue_free()


func on_hit():
	$TileSprite.playing = true
	on_hit_timer.start(0.2)
	

func end_on_hit_animation():
	$TileSprite.playing = false
	$TileSprite.frame = 0
