extends Area2D

signal hit


func _ready():
	var collisions = [
		$CollisionA
	]
	var sprites = [
		$SpriteA
	]
	
	var random_int = randi() % collisions.size()
	var selected_collision = collisions[random_int]
	var selected_sprite = sprites[random_int]
	selected_collision.disabled = false 
	selected_sprite.visible = true
	selected_collision.visible = true

func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()


func _on_body_entered(body):
	print("cami ya no me cae biren")
	if body.is_in_group("dinosaurio"):
		print("game over")
		hit.emit()
