extends KinematicBody2D

#Estas cosas configurables
export (float) var speed = 200
#Lo de uso interno no
var velocity = Vector2()

func start(position_node, number):
	global_transform = position_node.global_transform
	velocity = Vector2(-speed, 0)
	$Label.text = number


func _physics_process(delta):
	var collision = move_and_collide(velocity * delta)
	if collision:
		if collision.collider.is_in_group("drone"):
			print(collision.collider.OperationValue)
			if(float(collision.collider.OperationValue) == float($Label.text)):
				queue_free()
			else:
				add_collision_exception_with(collision.collider)
		if collision.collider.is_in_group("enemigo"):
				add_collision_exception_with(collision.collider)