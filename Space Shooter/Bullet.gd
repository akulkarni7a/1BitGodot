extends Area2D
var HitEffect = preload("res://HitEffect.tscn")

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.



func _process(delta):
	position.x += (100 * delta)

func createHitEffect():
	var hitEffect = HitEffect.instance()
	var main = get_tree().current_scene
	main.add_child(hitEffect)
	hitEffect.global_position = global_position
