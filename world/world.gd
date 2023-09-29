extends Node2D

var high_score = 0
const save_file_path = "user://savedata.save"
func _ready():
	$score.text = "Score : " +str($player.score)
	load_highscore()

func _process(delta):
	$score.text = "Score : " +str($player.score)
	
	if $player.d != 0:
		match $player.d:
			1:
				$life.change()
				$AudioStreamPlayer2D.play()
			2:
				$life2.change()
				$AudioStreamPlayer2D.play()
			3:
				$life3.change()
				$AudioStreamPlayer2D.play()
				if $player.score > high_score:
					high_score = $player.score
					save_highscore()
				$gameover/die.score = $player.score
				$gameover/die.visible = true
				
func save_highscore():
	var saveData = File.new()
	saveData.open(save_file_path , File.WRITE)
	saveData.store_var(high_score)
	saveData.close()

func load_highscore():
	var saveData = File.new()
	if saveData.file_exists(save_file_path):
		saveData.open(save_file_path , File.READ)
		high_score = saveData.get_var()
		saveData.close()
