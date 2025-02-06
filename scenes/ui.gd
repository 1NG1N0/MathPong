extends CanvasLayer
class_name ui
@onready var player_points_label = $MarginContainer/playerpoints
@onready var enemy_points_label = $MarginContainer/enemypoints
@onready var PlayerLives = $CanvasLayer/PlayerLives
@onready var EnemyLives = $CanvasLayer/PlayerLives2

func _ready():
	player_points_label.text = "%d" % 0
	enemy_points_label.text = "%d" % 0
	#PlayerLives.text = "%d" % 3
	#EnemyLives.text = "%d" % 3
	
	
	
func update_enemy_points(points: int):
	enemy_points_label.text = "%d" % points


func player_enemy_points(points: int):
	player_points_label.text = "%d" % points
	
	
	

func update_lives(player_lifes: int, enemy_lifes: int):
	PlayerLives.text = "%d" % player_lifes
	EnemyLives.text = "%d" % enemy_lifes
