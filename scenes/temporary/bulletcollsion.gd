extends Area2D



func _on_Bullet_Collision_area_entered(area):
	get_parent().queue_free()
