extends Node2D

enum{
	U, R, D, L #UP, RIGHY, LEFT, DOWN
}

var snap = load("res://global/StaticValues.gd").CELL_LENGTH


func place(position : Vector2):
	self.position.x = stepify(position.x, 16) + 8
	self.position.y = stepify(position.y, 16) + 8



func move(dir : int):
	match dir:
		R:
			position.x += snap
			$Sprite.flip_h = false
		L:
			position.x -= snap
			$Sprite.flip_h = true
		D:
			position.y += snap
		U:
			position.y -= snap
		
