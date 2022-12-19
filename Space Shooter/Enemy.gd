extends Area2D
export(int) var ARMOR = 3
var Explosion = preload("res://ExplosionEffect.tscn")

signal scoreUp
signal player_death

var justDied = false


func _ready():
	var main = get_tree().current_scene
	if main.is_in_group("World"): 
		connect("scoreUp",main,"_on_Enemy_Score_Up")
		connect("player_death",main,"_on_Ship_player_death")

func _process(delta):
	position.x -= (50*delta)


func _on_Enemy_area_entered(area):
	if area.is_in_group("Ship"):
		pass
	else:
		ARMOR -= 1
		area.createHitEffect()
		area.queue_free()
	
	if ARMOR <= 0:
		triggerExplosion()
		area.queue_free()
		queue_free()
		emit_signal("scoreUp")
		justDied = true
		

func triggerExplosion():
	var explosion = Explosion.instance()
	var main = get_tree().current_scene
	main.add_child(explosion)
	explosion.global_position = global_position


func _on_VisibilityNotifier2D_screen_exited():
	var x = global_position.x
	if x <= 0:
		emit_signal("player_death")
		#shp dies
	queue_free()
