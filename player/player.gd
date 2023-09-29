extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var t = false
var speed = 200
var score = 0
var velocity = Vector2()
var mouse_position = null
var normal_full = false
var num_of_eated_fishs = 0
var d =0
var levels = 1
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	velocity = Vector2(0  , 0)
	mouse_position = get_global_mouse_position()
	velocity = ((mouse_position - position).normalized()* speed)
	move_and_slide(velocity)
	look_at(mouse_position)
	if  num_of_eated_fishs == 10 and t == false :
		$AnimationPlayer.play("big fish")
		t = true
		levels += 1
	elif num_of_eated_fishs >= 20:
		$AnimationPlayer.play("very big fish")
		levels +=1

func die():
	d += 1
func eat():
	num_of_eated_fishs += 1
	score += 100
	$AudioStreamPlayer2D.play()
func _on_Area2D_body_entered(body):
	if body.is_in_group("fish"):
		if body.level <= levels:
			body.queue_free()
			num_of_eated_fishs += body.level
			score += 100 * body.level
			$AudioStreamPlayer2D.play()
		else:
			die()
