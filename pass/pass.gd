extends Control

var is_paused = false setget set_is_paused
# Declare member variables here. Examples:
# var a = 2
# var b = "text"
func _unhandled_input(event):
	if event.is_action_pressed("paused"):
		self.is_paused = !is_paused
func set_is_paused(value):
	is_paused = value
	get_tree().paused = is_paused
	visible = is_paused
# Called when the node enters the scene tree for the first time.
func _ready():
	$VBoxContainer/ResumeBtn.grab_focus()

func _on_ResumeBtn_pressed():
	self.is_paused= false


func _on_QuitBtn_pressed():
	
	get_tree().quit()
