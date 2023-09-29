extends KinematicBody2D

var speed = 130
var Blow = false
func _ready():
	pass # Replace with function body.


func _process(delta):
	global_position.x += speed * delta
func _on_Timer_timeout():
	if Blow == true :
		$AnimationPlayer.play("normal")
		Blow = false
	else:
		$AnimationPlayer.play("Blow")
		Blow = true


func _on_Area2D_body_entered(body):
	if body.is_in_group("player"):
		if Blow == true:
			body.die()
		else:
			body.eat()
			queue_free()
