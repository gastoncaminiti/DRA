tool

extends Node2D

export(PackedScene) var Enemy
export(PackedScene) var EnemyStats

var EnemiesSize



func _ready():
	$jugador.position.y = $Chanel1.position.y
	# Cargamos la informacion de los enemigos del archivo de operaciones correspondiente al nivel.
	var file = File.new()
	file.open("res://Operaciones/nivel1.txt", File.READ)
	var enemies_data = file.get_csv_line()
	file.close()
	# Creamos los enemigos en el nivel.
	EnemiesSize = enemies_data.size()
	for index in range(EnemiesSize):
		var e = Enemy.instance()
		e.start($Chanel1,enemies_data[index])
		e.position.x += 200 * index
		add_child(e)
	

func _process(delta):
	if(Input.is_action_pressed("Num1")):
		$jugador.position.y = $Chanel1.position.y
	if(Input.is_action_pressed("Num2")):
		$jugador.position.y = $Chanel2.position.y
	if(Input.is_action_pressed("Num3")):
		$jugador.position.y = $Chanel3.position.y
	if(Input.is_action_pressed("Num4")):
		$jugador.position.y = $Chanel4.position.y
	if(Input.is_action_pressed("Num5")):
		$jugador.position.y = $Chanel5.position.y
