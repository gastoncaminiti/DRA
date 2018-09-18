tool

extends Node2D

export(PackedScene) var Enemy
export(PackedScene) var EnemyStats

var EnemiesSize

func _ready():
	# Cargamos la informacion de los enemigos del archivo de operaciones correspondiente al nivel.
	var file = File.new()
	file.open("res://Operaciones/nivel1.txt", File.READ)
	var enemies_data = file.get_csv_line()
	file.close()
	# Creamos los enemigos en el nivel.
	EnemiesSize = enemies_data.size()
	for index in range(EnemiesSize):
		var e = Enemy.instance()
		var value_n = float(enemies_data[index])
		# Creamos los enemigos tomando en cuenta el resultado a calcular, teniendo en cuenta los resultados minimos y maximos que maneja cada generador.
		if(  value_n >= $Generador2.min_n and value_n <= $Generador2.max_n):
			e.start($Generador2,enemies_data[index])
			e.position.y += 150/($Generador2.max_n - $Generador2.min_n) * ($Generador2.max_n - value_n)
		elif(value_n >= $Generador3.min_n and value_n <= $Generador3.max_n):
			e.start($Generador3,enemies_data[index])
			e.position.y += 150/($Generador3.max_n - $Generador3.min_n) * ($Generador3.max_n - value_n)
		elif(value_n >= $Generador4.min_n and value_n <= $Generador4.max_n):
			e.start($Generador4,enemies_data[index])
			e.position.y += 150/($Generador4.max_n - $Generador4.min_n) * ($Generador4.max_n - value_n)
		else:
			e.start($Generador,enemies_data[index])
			e.position.y += 150/($Generador.max_n - $Generador.min_n) * ($Generador.max_n - value_n)
		e.position.x += 200 * index
		add_child(e)
	$jugador.position.y = $Generador.position.y + 133.33
	$jugador.OperationValue =  1

func _process(delta):
	if(Input.is_action_pressed("Num1")):
		$jugador.position.y = $Generador.position.y + 133.33
		$jugador.OperationValue =  1
	if(Input.is_action_pressed("Num2")):
		$jugador.position.y = $Generador.position.y + 116.66
		$jugador.OperationValue = 2
	if(Input.is_action_pressed("Num3")):
		$jugador.position.y = $Generador.position.y + 100
		$jugador.OperationValue = 3
	if(Input.is_action_pressed("Num4")):
		$jugador.position.y = $Generador.position.y + 83.33
		$jugador.OperationValue = 4
	if(Input.is_action_pressed("Num5")):
		$jugador.position.y = $Generador.position.y + 66.66
		$jugador.OperationValue = 5
	if(Input.is_action_pressed("Num6")):
		$jugador.position.y = $Generador.position.y + 50
		$jugador.OperationValue = 6
	if(Input.is_action_pressed("Num7")):
		$jugador.position.y = $Generador.position.y + 33.32
		$jugador.OperationValue = 7
	if(Input.is_action_pressed("Num8")):
		$jugador.position.y = $Generador.position.y + 16.66
		$jugador.OperationValue = 8
	if(Input.is_action_pressed("Num9")):
		$jugador.position.y = $Generador.position.y
		$jugador.OperationValue = 9
	# Actulizamos la información del Nivel en el HUB
	$PanelResultado/LResultado.text = str($jugador.OperationValue)
	if($jugador.OperationValue == 1):
		$PanelResultado/LMetros.text = "Metro"
	else:
		$PanelResultado/LMetros.text = "Metros"
