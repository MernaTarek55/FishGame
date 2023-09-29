extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var text 
var score = null
var players = []
func _ready():
	file_read()
	displayScores()
	print(players)
	$Label.text = text
	
func displayScores():
	text = ''
	for player in players:
		print(player["name"] + ": " + str(player["score"]))
		text += player["name"] + ": " + str(player["score"]) + "\n"
		
	
func _process(delta):
	pass
func file_read():
	var file = File.new()
	if file.open("res://players.txt", File.READ) == OK:
		print("file opened")
		while !file.eof_reached():
			print("didn't reach end of file")
			var line = file.get_line().strip_edges()  # Read and clean the line
			if line.empty():
				continue  # Skip empty lines

			# Split the line into key and value
			var parts = line.split(":")
			if parts.size() == 2:
				print("split with , ")
				var key = parts[0].strip_edges()
				var value = parts[1].strip_edges()
				var current_player = {
					"name": key,
					"score": int(value)
				}
				print(key)
				

				# Add the current player to the 'players' array
				players.append(current_player)
		print("Wrote success")
		file.close()
