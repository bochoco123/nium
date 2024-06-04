extends Node2D
@export var mob_scene: PackedScene
var screen_size : Vector2i

var PlayerInitialPosition

func _ready():
	screen_size = get_window().size
	PlayerInitialPosition = $Player.position
	Ghud.start_game.connect(new_game)
	
func game_over():
	Ghud.update_high_score_label()
	$MOBTimer.stop()

	
func new_game():
	print('cami quiere mucho a Jeshua')
	$Floor.position.x = 0
	$Player.position = PlayerInitialPosition
	$MOBTimer.start()
	Ghud.mob_counter = 0

func _process(delta):
	$Floor.position.x = $Player.position.x - 150

func _on_mob_timer_timeout():
	print('cami contó: ', Ghud.mob_counter,'mobs')
	if Ghud.mob_counter < 2:
		var mob = mob_scene.instantiate()
		mob.position.x = $Player.position.x + 1500
		mob.position.y = 640
		add_child(mob)
		mob.hit.connect(game_over)
