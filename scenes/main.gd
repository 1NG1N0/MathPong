extends Node2D

var mywin = preload("res://scenes/window.tscn")
var player_points = 0
var enemy_points = 0
var cena_bola = preload("res://scenes/corpos/ball.tscn") 
var vezes = 0
var timer = 0
var timere = 0
@onready var pergunta_timer = $CanvasLayer/Timer
@onready var pergunta_timer_enemy = $CanvasLayer/enemyTimer
@onready var pauseT = $"pause timer"
var perguntas = [
	"Quanto é 3/4 + 1/2",#Frações
	"Em qual dos intervalos abaixo estão o número 1/3?",#F2
	"Quais dessas frações resultam em um numero decimal igual: 1/3 - 2/3; 2/5 -  4/5; 1/3 - 3/9; 3/4 - 4/3",#F4
	"Quantos % de 100 e 3/4?",#F5
	"Antônio comprou 800 salgadinhos para uma festa de aniversário e pagou R$184,00. Quanto custou o cento do salgadinho?",#F6
	"Qual é o valor decimal e a porcentagem correspondente ao resultado de 1 dividido pela fração 2/5?",#F7
	"Qual é o valor que representa 10% de 2586?",#F8
	"Qual é a porcentagem que 27 representa de 150?",#F9
	"Em qual intervalo está o número 0,025 na escala de números reais?",#F10
	"A fração 10/4 é Maior, Menor ou igual a 8/2?",#F11
	"Numa sala que tem 30 alunos, será feito um único sorteio. Sabendo que há 20 meninos e 10 meninas, qual é a probabilidade de ser sorteado um menino?",#F12
	"A fração 2/4 é Maior, Menor ou igual a 8/15?",#F13
	"Qual é a porcentagem que 247 representa de 950?",#F14
	"Qual é o valor decimal e a porcentagem correspondente ao resultado de 1 dividido pela fração 1/4",#F15
	"Na rua onde Clara mora, há 70 construções, entre casas e prédios. O número de casas é igual a 9/5 do número de prédios. O número de casas nesta rua é:",#F16
	"Na eleição da turma de Carolina, três candidatos disputaram e todos os 36 alunos votaram. O 1º colocado obteve o triplo dos votos do 2º, e o último recebeu 4 votos. Quantos votos teve o vencedor?",#F17
	"A soma da idade de Carlos e João é 45 anos. Sabendo que a idade de Carlos é o dobro da idade de João, podemos dizer que a idade de Carlos é:",#F18
	"Se uma pessoa já liquidou os 7/16 do valor de uma dívida, a porcentagem dessa dívida que ainda deve pagar é:",#F19
	"Em uma escola, 60% dos alunos são meninas. O total dos alunos é 1.200. O número de alunos que são meninos é:",#F20
	"Se 2/3 dos 42 alunos de uma sala usam óculos, qual é número de alunos que não usam óculos?",#F21
	"Qual fração representa o número 1,25?",#F22
	"O número 4/9​ está entre quais dos seguintes intervalos de números decimais?",#F23
	"Em uma sala com 60 alunos, 2/5 tiraram nota acima de 8, 1/3 tirou entre 6 e 8, e o restante tirou abaixo de 6. Sabendo que a média escolar é 6, quantos alunos ficaram abaixo da média?",#F25
	"Uma sala de aula possui 24 alunos, sendo que 8 são meninas e 16 são meninos. A fração que representa a quantidade de meninas em relação ao todo é:",#F26
	"Qual é a fração escrita na forma simplificada, que corresponde ao número decimal 0,8?",#F30
	"Qual o valor da expressão 15 – 9,85 + 3,275?",#F31
	"Qual o resultado da multiplicação entre 0,96 e 0,5?",#F32
	"Em uma competição automobilística, a distância é medida em milhas. Cada milha vale 1,6 quilômetro, aproximadamente. Quantas milhas há em 512 quilômetros?",#F33
	"Com 16 litros de leite, quantas garrafas de 2/3 de litros poderão ser cheias?",#F34
	"Uma empresa utiliza um índice de massa corporal inventado por ela própria, no qual divide por dois a soma entre altura e peso dos funcionários. Qual é o índice de massa corporal de Rhuan, sabendo que sua altura é 1,78 m e seu peso é 72,3 kg?",#F35
	"Quanto é 10% de 95?",#F36
	"Quanto é 1% de 3580",#F37
	"Qual o resultado da multiplicação entre 0,37 e 0,4?",#F38
	"Qual o valor da expressão 12 – 6,15 + 1,979?",#f39
	"Se uma pessoa já liquidou os 2/6 do valor de uma dívida, a porcentagem dessa dívida que ainda deve pagar é:",#F40
	"Qual fração representa o número 0,55",#F41
	"A fração 6/4 é Maior, Menor ou igual a 1/2?",#F42
	"Quantos % de 100 e 3/9?",#F43
	"A previsão de probabilidade de chuva é de 65%. Qual é a probabilidade de não chover?",#F44
	"A fração 1/4 é Maior, Menor ou igual a 2/8?",#F45
	"Descubra a lógica e complete o próximo elemento: 1, 3, 5, 7, ___",#Raciocinio logico
	"Descubra a lógica e complete o próximo elemento: 2, 4, 8, 16, 32, 64, ____",#RL2
	"Descubra a lógica e complete o próximo elemento:  0, 1, 4, 9, 16, 25, 36, ____",#RL3
	"Descubra a lógica e complete o próximo elemento: 4, 16, 36, 64, ____",#RL4
	"Descubra a lógica e complete o próximo elemento: 1, 1, 2, 3, 5, 8, ____",#RL5
	"Descubra a lógica e complete o próximo elemento: 2,10, 12, 16, 17, 18, 19, ____",#RL6
	"Em um jogo de Paciência com 52 cartas, sete colunas são formadas: a primeira com 1 carta, a segunda com 2, e assim por diante até a sétima com 7 cartas. O restante forma o monte. Quantas cartas há no monte?",#RL7
	"Duas tartarugas caminham até um lago. A primeira percorre 30 m/dia e chega em 16 dias. A segunda, a 20 m/dia, chega depois. Quantos dias a primeira espera pela segunda?",#RL8
	"Alguns consideram que a cidade de Florianópolis foi fundada no dia 23 de março de 1726, que caiu em um sábado. Após 90 dias, no dia 21 de junho, a data assinalou o início do inverno, quando a noite é a mais longa do ano. Esse dia caiu em uma:",#RL9
	"Caminhando ao fim da tarde, uma senhora contou 20 casas em uma rua à sua direita. No regresso, ela contou 20 casas à sua esquerda. Quantas casas ela viu no total?",#RL10
	"Há um pato entre dois patos, um pato atrás de um pato e um pato na frente de outro pato. De quantos patos estamos falando?",#RL11
	"No meu jardim existe 3 pés de alface, 1 de pepino e 5 de cenoura. Quantos pés eu tenho no total?",#RL12
	"Meu avô tem 5 filhos, cada filho tem 3 filhos. Quantos primos eu tenho?",#RL13
	"Há 7 passarinhos em um galho de árvore. Um menino atira em um deles, quantos passarinhos sobraram no galho?",#RL14
	"Quando eu tinha 8 anos, a minha irmã tinha a metade da minha idade. Agora que tenho 55 anos, com quantos anos minha irmã está?",#RL15
	"Se um pacote tem 6 latas e você compra 5 pacotes, quantas latas há no total?",#Aritimetica
	"Se 4 amigos ganham 3 balas cada um, quantas balas há no total?",#A2
	"Qual é o produto de 8 x 8?",#A3
	"Qual é o resultado de 80 menos 22?",#A4
	"Se você tinha 50 maçãs e perdeu 15, quantas restam?",#A5
	"Se você somar 33 e 17, o que obtém?",#A6
	"Subtraia 37 de 98",#A7
	"Se você tem 100 balas e as distribui entre 4 amigos, quantas balas cada um recebe?",#A8
	"Qual é o quociente de 48 dividido por 8?",#A9
	"Se 72 é dividido em partes iguais por 8 pessoas, quantas partes cada uma recebe?",#A10
	"Resolva 3,25×2,8",#A11
	"Um aluno respondeu corretamente 80% de 25 questões em uma prova. Quantas questões ele acertou?",#A12
	"Uma peça de tecido tem 8 metros. Se um cliente comprar 2/5 do tecido, quantos metros ele levará?",#A13
	"Uma receita pede 300 g de açúcar para cada 500 g de farinha. Qual a quantidade de açúcar necessária para 2 kg de farinha?",#A14
	"Se 5 trabalhadores fazem uma tarefa em 8 horas, quanto tempo levarão 10 trabalhadores para fazer a mesma tarefa, considerando o trabalho proporcional?",#A15
	"Qual é o resto da divisão de 10005 por 5?",#A16
	"Quantos lados tem um pentágono?",#Geometria básica
	"Quanto é 0,75 + 0,25?",#Números decimais
	"Quanto é 50% de 200?",#Porcentagem
	"Se X+5=10, quanto vale X?",#Equação simples
	"Qual é a área de um triângulo de base 10 cm e altura 5 cm?",#Área de figuras
	"Se 2 maçãs custam R$4,00, quanto custam 5 maçãs?",#Razões e proporções
	"Num triângulo retângulo, os catetos medem 3 e 4. Qual é o valor da hipotenusa?",#Pitágoras
	"Se um produto custa R$200 e tem 20% de desconto, qual é o preço final?",#Porcentagem aplicada
	"Qual é o MDC de 36 e 48?",#MDC
	"Se f(x)=2x+3, quanto vale f(2)?",#Função simples
	"Qual é a raiz positiva da equação x²-4X+4=0",#Equação do 2º grau
	"Um produto teve aumento de 10% e depois mais 20%. Qual foi o aumento total?"#Porcentagem cumulativa
	
]
var respostas = [
	["7/4", "5/4", "3/4", "6/4"],#F!
	["entre 0 e 0,5", "entre 0,5 e 1", "entre 2 e 2,5", "entre 3 e 3,5"],#F2
	["1/3 - 3/9", "1/3 - 2/3", "2/5 - 4/5", "3/4 - 4/3"],#F4
	["75%", "67%", "80%", "55%"],#F5
	["23", "25", "36", "32"],#F6
	["0,2 e 20%", "0,3 e 30%", "0,22 e 22%", "0,10 e 10%"],#F7
	["258,6", "325,8", "258,8", "256"],#F8
	["18%", "23%", "20%", "19%"],#F9
	["0 e 0,1", "0,25 e 0,3", "0,2 e 0,3", "0,3 e 0,5"],#F10
	["Menor", "Igual", "Maior", "Nenhuma das anteriores"],#F11
	["2/3", "55%", "70%", "1 terço da sala"],#F12
	["Menor", "Igual", "Maior", "Nenhuma das anteriores"],#F13
	["26%", "30%", "25%", "35%"],#F14
	["0,25 e 25%", "0,3 e 30%", "0,15 e 15%", "0,20 e 20%"],#F15
	["45", "35", "25", "55"],#F16
	["24", "16", "15", "8"],#F17
	["30", "25", "28", "32"],#F18
	["56,25%", "55%", "55,5%", "57,15%"],#F19
	["480", "560", "450", "500"],#F20
	["14", "15", "13", "16"],#F21
	["5/4", "2/3", "6/4", "5/6"],#f22
	["0,3 e 0,5", "0,5 e 0,7", "0,2 e 0,4", "0,7 e 0,9"],#F23
	["1/5", "4/12", "3/10", "1/6"],#F24
	["16", "15", "12", "9"],#F25
	["1/3", "1/4", "2/3", "1/2"],#F26
	["4/15", "2/15", "11/15", "1/15"],#F27
	["7/20", "13/20", "7/10", "3/20"],#F28
	["8/11", "2/3", "3/11", "11/24"],#F29
	["4/5", "2/3", "3/9", "5/15"],#F30
	["8,425", "8,318", "8,975", "8,225"],#F31
	["0,480", "0,533", "0,675", "0,460"],#F32
	["320", "300", "295", "330"],#F33
	["24", "20", "26", "22"],#F34
	["37,04", "31,15", "37,4", "37"],#f35
	["9,5", "9,3", "9", "8,5"],#F36
	["35,8", "35", "36", "35,5"],#F37
	["0,148", "0,234", "0,560", "0,150"],#F38
	["7,829", "7,658", "6,950", "7,800"],#F39
	["66,67%", "60%", "50%", "70,5%"],#F40
	["11/20", "55/100", "5/11", "22/40"],#f41
	["Maior", "Menor", "Igual", "Nenhuma das anteriores"],#f42
	["33,3%", "30,5%", "33%", "34%"],#F43
	["40%", "30%", "45%", "35%"],#F44
	["Igual", "Maior", "Menor", "Nenhuma das anteriores"],#F45
	["9", "8", "-9", "11"],#Raciocinio logico
	["128", "92", "80", "120"],#RL2
	["49", "40", "55", "45"],#RL3
	["100", "96", "80", "90"],#RL4
	["13", "12", "14", "11"],#RL5
	["200", "20", "100", "50"],#RL6
	["28", "21", "26", "31"],#RL7
	["8", "9", "10", "12"],#RL8
	["6° feira", "2° feira", "3° feira", "5° feira"],#RL9
	["20", "30", "40", "35"],#RL10
	["3", "4", "2", "5"],#RL11
	["2", "3", "9", "10"],#RL12
	["12", "11", "15", "16"],#RL13
	["0", "6", "7", "5"],#RL14
	["51", "24", "35", "43"],#RL15
	["30", "25", "36", "24"],#aritimetica
	["12", "10", "9", "15"],#A2
	["64", "60", "56", "72"],#A3
	["58", "68", "65", "60"],#a4
	["35", "30", "45", "25"],#A5
	["50", "45", "40", "55"],#A6
	["61", "71", "65", "57"],#A7
	["25", "30", "35", "20"],#A8
	["6", "7", "10", "8"],#A9
	["9", "7", "10", "15"],#A10
	["9,1", "8,1", "9,5", "9,3"],#A11
	["20", "22", "21", "19"],#A12
	["3,2", "3", "3,5", "4"],#a13
	["1,2KG", "1KG", "1,5KG", "900G"],#A14
	["4h", "3h", "5h", "6h"],#A15
	["A divisão é exata", "O resto é 1", "O resto é 5", "O resto não é 0, 1 ou 5"],#A16
	["5", "6", "7", "8"],
	["1", "0,9", "1,1", "1,5"],
	["100", "75", "120", "150,5"], 
	["5", "10", "6", "8"],
	["25cm²", "50cm²", "15cm²", "20cm²"],
	["R$10,00", "R$1,00", "R$12,00", "R$11,00"],
	["5", "5,5", "6", "4,8"],
	["R$160", "R$180", "R$185", "R$155"],
	["12", "6", "18", "10"],
	["7", "6", "9", "5"],
	["2", "0", "-2", "-1"],
	["32%", "30%", "31%", "29%"]
	
]

var pergunta_atual = -1  # Índice da pergunta atual
var resposta_correta = ""  # Texto da resposta correta

@onready var enemy_paddle = $enemypaddle
@onready var player_paddle = $Paddle
@onready var ball = $Ball as Ball
@onready var ui = $CanvasLayer as ui

func enemy_scored():
	enemy_points += 1
	Lives.golsplayer2 += 1
	ui.update_enemy_points(enemy_points)
	reset_game_state()

func _gol_do_neymar():
	player_points += 1
	Lives.golsplayer1 += 1
	ui.player_enemy_points(player_points)
	reset_game_state()


func reset_game_state():
	enemy_paddle.global_position.y = 0
	player_paddle.global_position.y = 0
	ball.velocity = Vector2.ZERO
	ball.global_position = Vector2.ZERO
	enemy_paddle.linear_velocity = Vector2.ZERO
	player_paddle.linear_velocity = Vector2.ZERO
	ball.start_ball()
	if player_points == 3:
		show_win_message()
		player_points = 0
		enemy_points = 0
	elif enemy_points == 3:
		show_win_message2()
		enemy_points = 0
		player_points = 0

func show_win_message():#message: String):
	var sorteio = get_random_question_and_answers()
	var pergunta_texto = sorteio["pergunta"]
	var alternativas = sorteio["respostas"]
	resposta_correta = alternativas[0]
	alternativas = shuffle_array(alternativas)
	
	#$CanvasLayer/TextureRect.show()
	$"CanvasLayer/Panel/Label(player1)".text = pergunta_texto
	$CanvasLayer/Panel/Menu/Label.text = alternativas[0]
	$CanvasLayer/Panel/Menu/Label2.text = alternativas[1]
	$CanvasLayer/Panel/Menu/Label3.text = alternativas[2]
	$CanvasLayer/Panel/Menu/Label4.text = alternativas[3]
	#$CanvasLayer/TextureRect.position = Vector2(-482, 646)
	ball.queue_free() 
	$CanvasLayer/Panel.show()
	$CanvasLayer/Panel/Menu.show()
	Lives.perguntasrespplayer1 += 1
	pergunta_timer.start()
	#$CanvasLayer/TextureRect.hide( )

func get_random_message(messages: Array) -> String:
	return messages[randi() % perguntas.size()]
func restart_game():
	pauseT.stop()
	ball = cena_bola.instantiate() 
	add_child(ball)
	ball.start_ball()
	timere = 0
	timer = 0
	$CanvasLayer/Panel.hide()
	$CanvasLayer/Panel/Menu.hide()
	pergunta_timer.stop()
	pergunta_timer_enemy.stop()
	

func _on_button_pressed() -> void:
	Lives.enemy_lifes -= 1
	restart_game()
	$CanvasLayer/Panel.hide()
	if Lives.enemy_lifes == 0:
		player_points = 0
		enemy_points = 0
		Lives.enemy_lifes = 0
		get_tree().change_scene_to_file("res://scenes/fimdejogo.tscn")
		
func show_win_message2():
	var sorteio = get_random_question_and_answers()
	var pergunta_texto = sorteio["pergunta"]
	var alternativas = sorteio["respostas"]
	resposta_correta = alternativas[0]
	alternativas = shuffle_array(alternativas)
	
	#$CanvasLayer/TextureRect.show()
	$"CanvasLayer/Panel/Label(player1)".text = pergunta_texto
	$CanvasLayer/Panel/Menu2/Label.text = alternativas[0]
	$CanvasLayer/Panel/Menu2/Label2.text = alternativas[1]
	$CanvasLayer/Panel/Menu2/Label3.text = alternativas[2]
	$CanvasLayer/Panel/Menu2/Label4.text = alternativas[3]
	#$CanvasLayer/TextureRect.position = Vector2(-482, 646)
	ball.queue_free() 
	$CanvasLayer/Panel.show()
	Lives.perguntasrespplayer2 += 1
	pergunta_timer_enemy.start()
	$CanvasLayer/Panel/Menu2.show()
	#$CanvasLayer/TextureRect.hide( )
	
func _on_menu_actioned(item: Control) -> void:
	if item.text == resposta_correta:
		Lives.perguntasaceplayer1 += 1
		$CanvasLayer/Panel.hide()
		$CanvasLayer/Panel/Menu.hide()
		if Lives.player_lifes >= 3:
			Lives.enemy_lifes -= 1
		elif Lives.player_lifes < 3:
			Lives.player_lifes += 1
			Lives.enemy_lifes -= 1
			
		player_points = 0
		enemy_points = 0
		if Lives.enemy_lifes == 3:
			$CanvasLayer/CanvasLayer/PlayerLives2.texture = preload("res://assests/HeartsFrame1.png")
		elif Lives.enemy_lifes == 2:
			$CanvasLayer/CanvasLayer/PlayerLives2.texture = preload("res://assests/HeartsFrame2.png")
		elif Lives.enemy_lifes == 1:
			$CanvasLayer/CanvasLayer/PlayerLives2.texture = preload("res://assests/HeartsFrame3.png")
		if Lives.player_lifes == 3:
			$CanvasLayer/CanvasLayer/PlayerLives.texture = preload("res://assests/HeartsFrame1.png")
		elif Lives.player_lifes == 2:
			$CanvasLayer/CanvasLayer/PlayerLives.texture = preload("res://assests/HeartsFrame2.png")
		elif Lives.player_lifes == 1:
			$CanvasLayer/CanvasLayer/PlayerLives.texture = preload("res://assests/HeartsFrame3.png")
		#ui.update_lives(Lives.player_lifes, Lives.enemy_lifes)
		ui.update_enemy_points(enemy_points)
		ui.player_enemy_points(player_points)
		if Lives.player_lifes <= 0 or Lives.enemy_lifes <= 0:
			get_tree().change_scene_to_file("res://scenes/Stats.tscn")
			Lives.enemy_lifes = 3
			Lives.player_lifes = 3
			return  
		pauseT.start()
	else:
		$CanvasLayer/Panel.hide()
		$CanvasLayer/Panel/Menu.hide()
		Lives.player_lifes -= 1
		player_points = 0
		enemy_points = 0
		if Lives.enemy_lifes == 3:
			$CanvasLayer/CanvasLayer/PlayerLives2.texture = preload("res://assests/HeartsFrame1.png")
		elif Lives.enemy_lifes == 2:
			$CanvasLayer/CanvasLayer/PlayerLives2.texture = preload("res://assests/HeartsFrame2.png")
		elif Lives.enemy_lifes == 1:
			$CanvasLayer/CanvasLayer/PlayerLives2.texture = preload("res://assests/HeartsFrame3.png")
		if Lives.player_lifes == 3:
			$CanvasLayer/CanvasLayer/PlayerLives.texture = preload("res://assests/HeartsFrame1.png")
		elif Lives.player_lifes == 2:
			$CanvasLayer/CanvasLayer/PlayerLives.texture = preload("res://assests/HeartsFrame2.png")
		elif Lives.player_lifes == 1:
			$CanvasLayer/CanvasLayer/PlayerLives.texture = preload("res://assests/HeartsFrame3.png")
		print(Lives.player_lifes, ", ", Lives.enemy_lifes)
		#ui.update_lives(Lives.player_lifes, Lives.enemy_lifes)
		ui.update_enemy_points(enemy_points)
		ui.player_enemy_points(player_points)
		if Lives.player_lifes == 0 or Lives.enemy_lifes == 0:
			get_tree().change_scene_to_file("res://scenes/Stats.tscn")
			Lives.enemy_lifes = 3
			Lives.player_lifes = 3
			return
		pauseT.start()
	
func _on_menu_2_actioned(item: Control) -> void:
	if item.text == resposta_correta:
		Lives.perguntasaceplayer2 += 1
		$CanvasLayer/Panel.hide()
		$CanvasLayer/Panel/Menu2.hide()
		if Lives.enemy_lifes >= 3:
			Lives.player_lifes -= 1
		elif Lives.enemy_lifes < 3:
			Lives.enemy_lifes += 1
			Lives.player_lifes -= 1
		print(Lives.player_lifes, ", ", Lives.enemy_lifes)
		if Lives.enemy_lifes == 3:
			$CanvasLayer/CanvasLayer/PlayerLives2.texture = preload("res://assests/HeartsFrame1.png")
		elif Lives.enemy_lifes == 2:
			$CanvasLayer/CanvasLayer/PlayerLives2.texture = preload("res://assests/HeartsFrame2.png")
		elif Lives.enemy_lifes == 1:
			$CanvasLayer/CanvasLayer/PlayerLives2.texture = preload("res://assests/HeartsFrame3.png")
		if Lives.player_lifes == 3:
			$CanvasLayer/CanvasLayer/PlayerLives.texture = preload("res://assests/HeartsFrame1.png")
		elif Lives.player_lifes == 2:
			$CanvasLayer/CanvasLayer/PlayerLives.texture = preload("res://assests/HeartsFrame2.png")
		elif Lives.player_lifes == 1:
			$CanvasLayer/CanvasLayer/PlayerLives.texture = preload("res://assests/HeartsFrame3.png")
		#ui.update_lives(Lives.player_lifes, Lives.enemy_lifes)
		ui.update_enemy_points(enemy_points)
		ui.player_enemy_points(player_points)
		if Lives.player_lifes == 0 or Lives.enemy_lifes == 0:
			get_tree().change_scene_to_file("res://scenes/Stats.tscn")
			Lives.enemy_lifes = 3
			Lives.player_lifes = 3
			return
		pauseT.start()
	else:
		$CanvasLayer/Panel.hide()
		$CanvasLayer/Panel/Menu2.hide()
		player_points = 0
		enemy_points = 0
		Lives.enemy_lifes -= 1
		if Lives.enemy_lifes == 3:
			$CanvasLayer/CanvasLayer/PlayerLives2.texture = preload("res://assests/HeartsFrame1.png")
		elif Lives.enemy_lifes == 2:
			$CanvasLayer/CanvasLayer/PlayerLives2.texture = preload("res://assests/HeartsFrame2.png")
		elif Lives.enemy_lifes == 1:
			$CanvasLayer/CanvasLayer/PlayerLives2.texture = preload("res://assests/HeartsFrame3.png")
		if Lives.player_lifes == 3:
			$CanvasLayer/CanvasLayer/PlayerLives.texture = preload("res://assests/HeartsFrame1.png")
		elif Lives.player_lifes == 2:
			$CanvasLayer/CanvasLayer/PlayerLives.texture = preload("res://assests/HeartsFrame2.png")
		elif Lives.player_lifes == 1:
			$CanvasLayer/CanvasLayer/PlayerLives.texture = preload("res://assests/HeartsFrame3.png")
		print(Lives.player_lifes, ", ", Lives.enemy_lifes)
		#ui.update_lives(Lives.player_lifes, Lives.enemy_lifes)
		ui.update_enemy_points(enemy_points)
		ui.player_enemy_points(player_points)
		if Lives.player_lifes == 0 or Lives.enemy_lifes == 0:
			get_tree().change_scene_to_file("res://scenes/Stats.tscn")
			Lives.enemy_lifes = 3
			Lives.player_lifes = 3
			return
		pauseT.start()
		
func get_random_question_and_answers():
	var pergunta_index = randi() % perguntas.size()
	return {
		"pergunta": perguntas[pergunta_index],
		"respostas": respostas[pergunta_index]
	}
	
	
func shuffle_array(array: Array) -> Array:
	for i in range(array.size() - 1, 0, -1):
		var j = randi() % (i + 1)
		var temp = array[i]
		array[i] = array[j]
		array[j] = temp
	return array
	

func _on_timer_timeout() -> void:
	timer += 1
	print("Timer: ", timer)  # Para verificar se está funcionando
	if timer == 45:
		print("Entrou no IF: Timer chegou a 10!")
		$CanvasLayer/Panel.hide()
		$CanvasLayer/Panel/Menu.hide()
		Lives.player_lifes -= 1
		player_points = 0
		enemy_points = 0
		if Lives.enemy_lifes == 3:
			$CanvasLayer/CanvasLayer/PlayerLives2.texture = preload("res://assests/HeartsFrame1.png")
		elif Lives.enemy_lifes == 2:
			$CanvasLayer/CanvasLayer/PlayerLives2.texture = preload("res://assests/HeartsFrame2.png")
		elif Lives.enemy_lifes == 1:
			$CanvasLayer/CanvasLayer/PlayerLives2.texture = preload("res://assests/HeartsFrame3.png")
		if Lives.player_lifes == 3:
			$CanvasLayer/CanvasLayer/PlayerLives.texture = preload("res://assests/HeartsFrame1.png")
		elif Lives.player_lifes == 2:
			$CanvasLayer/CanvasLayer/PlayerLives.texture = preload("res://assests/HeartsFrame2.png")
		elif Lives.player_lifes == 1:
			$CanvasLayer/CanvasLayer/PlayerLives.texture = preload("res://assests/HeartsFrame3.png")
		print(Lives.player_lifes, ", ", Lives.enemy_lifes)
		#ui.update_lives(Lives.player_lifes, Lives.enemy_lifes)
		ui.update_enemy_points(enemy_points)
		ui.player_enemy_points(player_points)
		if Lives.player_lifes == 0 or Lives.enemy_lifes == 0:
			get_tree().change_scene_to_file("res://scenes/Stats.tscn")
		timer = 0
		timere = 0
		pauseT.start()
		pergunta_timer.stop()
	else:
		print("Timer ainda não chegou a 10.")
		
	if timer != 0:
		pergunta_timer.start()
	else: 
		pergunta_timer.stop()
		timer = 0
		timere = 0

func _on_enemy_timer_timeout() -> void:
	timere += 1
	print("Timer: ", timere)  # Para verificar se está funcionando
	if timere == 45:
		$CanvasLayer/Panel.hide()
		$CanvasLayer/Panel/Menu2.hide()
		Lives.enemy_lifes -= 1
		player_points = 0
		enemy_points = 0
		if Lives.enemy_lifes == 3:
			$CanvasLayer/CanvasLayer/PlayerLives2.texture = preload("res://assests/HeartsFrame1.png")
		elif Lives.enemy_lifes == 2:
			$CanvasLayer/CanvasLayer/PlayerLives2.texture = preload("res://assests/HeartsFrame2.png")
		elif Lives.enemy_lifes == 1:
			$CanvasLayer/CanvasLayer/PlayerLives2.texture = preload("res://assests/HeartsFrame3.png")
		if Lives.player_lifes == 3:
			$CanvasLayer/CanvasLayer/PlayerLives.texture = preload("res://assests/HeartsFrame1.png")
		elif Lives.player_lifes == 2:
			$CanvasLayer/CanvasLayer/PlayerLives.texture = preload("res://assests/HeartsFrame2.png")
		elif Lives.player_lifes == 1:
			$CanvasLayer/CanvasLayer/PlayerLives.texture = preload("res://assests/HeartsFrame3.png")
		print(Lives.player_lifes, ", ", Lives.enemy_lifes)
		#ui.update_lives(Lives.player_lifes, Lives.enemy_lifes)
		ui.update_enemy_points(enemy_points)
		ui.player_enemy_points(player_points)
		if Lives.player_lifes == 0 or Lives.enemy_lifes == 0:
			get_tree().change_scene_to_file("res://scenes/Stats.tscn")
		timere = 0
		timer = 0
		pergunta_timer_enemy.stop()
		pauseT.start()
	else:
		print("Timer ainda não chegou a 10.")
	if timere != 0:
		pergunta_timer.start()
	else:
		timere = 0
		timer = 0
		pergunta_timer.stop()


func _on_pause_timer_timeout() -> void:
	restart_game()
