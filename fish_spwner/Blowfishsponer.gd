extends Node2D


var spawn_positions = null

var Fish = preload("res://Blowfish/Blowfish.tscn") 

func _ready():
	randomize()
	spawn_positions = $spawnerPositions.get_children()
	
func spawn_fish():
	var index = randi() % spawn_positions.size()
	var fish = Fish.instance()
	fish.global_position = spawn_positions[index].global_position
	add_child(fish)
	
func _on_spawnTimer_timeout():
	spawn_fish()
