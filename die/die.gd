extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var score = 0
var high_score = 0
const save_file_path = "user://savedata.save"
# Called when the node enters the scene tree for the first time.
func _ready():
	$VBoxContainer/MenuBtn.grab_focus()
	$Label2.text = "Score : " +str(score)
	$Label3.text = "Best Score : " +str(high_score)
func _process(delta):
	load_highscore()
	$Label2.text = "Score : " +str(score)
	$Label3.text = "Best Score : " +str(high_score)

func _on_MenuBtn_pressed():
	get_tree().change_scene("res://Main_menu/Main_menu.tscn")
func _on_QuitBtn_pressed():
	get_tree().quit()


func load_highscore():
	var saveData = File.new()
	if saveData.file_exists(save_file_path):
		saveData.open(save_file_path , File.READ)
		high_score = saveData.get_var()
		saveData.close()
