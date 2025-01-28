extends Node2D

var	wall = load("res://tiles/Wall.tscn")
var	floor = load("res://tiles/Floor.tscn")
var player = load("res://tiles/player.tscn")
var	door = load("res://tiles/door.tscn")

func _ready() -> void:
	plot_level("start")
	
func	plot_level(level_name):
	clear()
	var map = FileAccess.open("levels/" + level_name + ".txt", FileAccess.READ)
	var lines = map.get_as_text().split("\n")
	map.close
	var position_vector = Vector2.ZERO
	for line in lines:
		var tiles = line.split(" ")
		for tile in tiles:
			if tile == "W":
				var new_wall = wall.instantiate()
				new_wall.position = position_vector
				add_child(new_wall)
				new_wall.add_to_group("map")
			if tile == "F" or tile == "P":
				var new_floor = floor.instantiate()
				new_floor.position = position_vector
				new_floor.add_to_group("map")
				add_child(new_floor)
			if tile == "P":
				var new_player = player.instantiate()
				new_player.position = position_vector
				new_player.add_to_group("map")
				add_child(new_player)
			if tile.begins_with("D"):
				var new_door = door.instantiate()
				new_door.position = position_vector
				new_door.define_access(tile.split(",")[1])
				new_door.load_level.connect(plot_level)
				new_door.add_to_group("map")
				add_child(new_door)
			position_vector.x += 16
		position_vector.x = 0
		position_vector.y += 16

func	clear():
	for node in get_tree().get_nodes_in_group("map"):
		node.queue_free()
	
