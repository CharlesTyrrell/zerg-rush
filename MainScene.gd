extends Node2D



onready var Monsters = $Monsters
var Zombie = load("res://scenes/entities/monsters/Zombie.tscn")
var zombie_timer = 1
var timer : Timer = Timer.new()

onready var window_size = Vector2(352, 240) #OS.window_size

var CURRENT_MONSTERS :int
export (int) var round_num : int = 0
const ROUND_END_TIME = 2
var end_round_timer : Timer = Timer.new()


func _ready():
	end_round_timer.one_shot = true
	add_child(end_round_timer)
	add_child(timer)
	
	start_new_round()

func start_new_round():
	round_num = round_num + 1
	CURRENT_MONSTERS = round_num * 5
#	var sprite_texture = load("res://GameOver.png")
#	var sprite = Sprite.new()
#	sprite.texture = sprite_texture
	
#	add_child(sprite)
	end_round_timer.connect("timeout",self,"spawn_monsters")
#	end_round_timer.connect("timeout",sprite,"queue_free")
	end_round_timer.start(ROUND_END_TIME)
	

func spawn_monsters():
	for i in CURRENT_MONSTERS:
		spawn_zombie()

func zombie_killed():
	print("Zombie killed")
	CURRENT_MONSTERS -= 1
	
	if (CURRENT_MONSTERS <= 0):
		print("No more monsters")
		start_new_round()



func interval_spawn():
	
	add_child(timer)
	timer.connect("timeout", self, "spawn_zombie")
	timer.start(zombie_timer)


func spawn_zombie():
	var zombie : Node2D = Zombie.instance()
	
	while(zombie.position.x > -20 && zombie.position.x < 20):
		zombie.position.x = float(randi() % int(window_size.x)) - window_size.x /2
		
	while(zombie.position.y > -20 && zombie.position.y < 20):
		zombie.position.y = float(randi() % int(window_size.y)) - window_size.y /2
	add_child(zombie)
	zombie.connect("tree_exited", self, "zombie_killed")

func game_over():
	
	var game_over_texture = load("res://GameOver.png")
	var game_over_sprite = Sprite.new()
	game_over_sprite.texture = game_over_texture
	
	add_child(game_over_sprite)
	
	var new_game_timer = Timer.new()
	add_child(new_game_timer)
	new_game_timer.connect("timeout", self, "after_game_over")
	new_game_timer.start(4)

func after_game_over():
	get_tree().reload_current_scene()
