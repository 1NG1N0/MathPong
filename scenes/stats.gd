extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#player 1
	$Panel/Panel/Label.text = Lives.player1nome
	$"Panel/Panel/Player 1/Label".text = str(Lives.golsplayer1)
	$"Panel/Panel/Player 1/Label2".text = str(Lives.perguntasaceplayer1)
	$"Panel/Panel/Player 1/Label3".text = str(Lives.perguntasrespplayer1)
	if Lives.perguntasrespplayer1 > 0:
		var porcentagem1 = (float(Lives.perguntasaceplayer1) / Lives.perguntasrespplayer1) * 100
		$"Panel/Panel/Player 1/Label4".text = str(round(porcentagem1)) + "%"
	else:
		$"Panel/Panel2/Player 1/Label4".text = "0%"
	
	
	#player 2
	$Panel/Panel2/Label.text = Lives.player2nome
	$"Panel/Panel2/Player 2/Label".text = str(Lives.golsplayer2)
	$"Panel/Panel2/Player 2/Label2".text = str(Lives.perguntasaceplayer2)
	$"Panel/Panel2/Player 2/Label3".text = str(Lives.perguntasrespplayer2)
	if Lives.perguntasrespplayer2 > 0:
		var porcentagem2 = (float(Lives.perguntasaceplayer2) / Lives.perguntasrespplayer2) * 100
		$"Panel/Panel2/Player 2/Label4".text = str(round(porcentagem2)) + "%"
	else:
		$"Panel/Panel2/Player 2/Label4".text = "0%"


func _on_button_pressed() -> void:
	Lives.golsplayer1 = 0
	Lives.golsplayer2 = 0
	Lives.perguntasaceplayer1 = 0
	Lives.perguntasaceplayer2 = 0
	Lives.perguntasrespplayer1 = 0
	Lives.perguntasrespplayer2 = 0
	get_tree().change_scene_to_file("res://scenes/inicial_menu.tscn")
