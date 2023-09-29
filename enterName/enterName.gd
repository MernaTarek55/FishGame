extends Control
var my_dict = {}
var score = null
const save_file_path = "user://savescore.txt"
var player_name
var player_score

var players = []
func _ready():
	pass

func _process(delta):
	if Input.is_action_pressed("entername"):
		player_name = $TextEdit.text
		player_score = score
		add_player()
		file_write()
		get_tree().change_scene("res://loadscore/loadScore.tscn")

		
func add_player():
	var newPlayer ={ 
		"name": player_name,"score": player_score
	}
	players.append(newPlayer)

func file_write():
	var file = File.new()
	if file.open("res://players.txt", File.WRITE) == OK:
		for player in players:
			file.store_line(player["name"] + " : " + str(player["score"]))
		file.close()
