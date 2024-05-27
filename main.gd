extends Node2D

var screen_size : Vector2i

var PlayerInitialPosition

func _ready():
	screen_size = get_window().size
	PlayerInitialPosition = $Player.position


func _process(delta):
	$Floor.position.x = $Player.position.x - 100
	
