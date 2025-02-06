extends Node2D


func _on_olay_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/names.tscn")

func _on_sair_pressed() -> void:
	get_tree().quit()

func _on_reddit_pressed() -> void:
	OS.shell_open("https://www.reddit.com/user/InabiltyGameDev/?utm_source=share&utm_medium=web3x&utm_name=web3xcss&utm_term=1&utm_content=share_button")

func _on_itch_pressed() -> void:
	OS.shell_open("https://nandoing.itch.io/")

func _on_discord_pressed() -> void:
	OS.shell_open("https://discord.gg/3nXe3ktx")

func _on_submit_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/tutoras.tscn")


func _on_line_edit_text_submitted(new_text: String) -> void:
	Lives.player1nome = new_text.strip_edges()
	
func _on_line_edit_2_text_submitted(new_text: String) -> void:
	Lives.player2nome = new_text.strip_edges()
