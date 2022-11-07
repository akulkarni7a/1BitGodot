extends Node2D

const Enemy = preload("res://Enemy.tscn")

onready var spawnPoints = $SpawnPoints

func getSpawnPoints():
	var points = spawnPoints.get_children()
	points.shuffle()
	return points[0].global_position
	
func spawn_enemy():
	print("hi")
	var spawnPosition = getSpawnPoints()
	var enemy = Enemy.instance()
	var main = get_tree().current_scene
	main.add_child(enemy)
	enemy.global_position = spawnPosition
	
func _on_Timer_timeout():
	spawn_enemy()
