extends Node2D


onready var rocketship = $Rocket
onready var animationPlayer = $AnimationPlayer


func _on_TextureButton_pressed():
	animationPlayer.play("Launch")
