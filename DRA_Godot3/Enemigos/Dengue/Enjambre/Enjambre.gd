extends KinematicBody2D

#Estas cosas configurables
export (float) var speed = 200
#Lo de uso interno no
var velocity = Vector2()

func _ready():
	velocity = Vector2(-speed, 0)

func _physics_process(delta):
	var collision = move_and_collide(velocity * delta)
	if collision:
		queue_free()
