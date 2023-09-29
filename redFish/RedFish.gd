extends KinematicBody2D


var speed = 150
var level =3
func _ready():
	pass # Replace with function body.

func _process(delta):
	global_position.x += speed * delta
