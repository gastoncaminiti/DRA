extends Node2D

func _ready():
	$jugador.position.y = $Chanel1.position.y
	$Enjambre/Label.text = "1"
	$Enjambre2/Label.text = "2"
	$Enjambre3/Label.text = "3"
	$Enjambre4/Label.text = "4"
	$Enjambre5/Label.text = "5"

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
