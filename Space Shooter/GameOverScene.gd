extends Node

onready var highScoreLabel = $HighScoreLabel

# Called when the node enters the scene tree for the first time.
func _ready():
	set_highScore_label()



func _process(delta):
	if Input.is_action_just_pressed("ui_accept"):
		get_tree().change_scene("res://World.tscn")

func set_highScore_label():
	var save_data = SaveAndLoad.load_data_from_file()
	highScoreLabel.text = "Highscore: "+str(save_data.highScore)
