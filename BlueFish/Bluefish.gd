extends KinematicBody2D


var speed = 100
var level =2
func _ready():
	pass # Replace with function body.


func _process(delta):
	global_position.x += speed * delta
