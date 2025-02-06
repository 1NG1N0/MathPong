extends Node2D




func _on_button_pressed() -> void:
	Lives.enemy_lifes = 3
	Lives.player_lifes = 3
	get_tree().change_scene_to_file("res://scenes/main.tscn")
	
	
