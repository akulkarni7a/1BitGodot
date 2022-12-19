extends Node

var score = 0 setget setScore
onready var scoreLabel = $ScoreLabel

func setScore(value):
	score = value
	scoreLabel.text = "Score: "+str(score)

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _on_Enemy_Score_Up():
	self.score += 10

func updateSaveData():
	var save_data = SaveAndLoad.load_data_from_file()
	if score > save_data.highScore:
		#new high score
		save_data.highScore = score
		SaveAndLoad.save_data_to_file(save_data)


func _on_Ship_player_death():
	updateSaveData()
	yield(get_tree().create_timer(1),"timeout")
	get_tree().change_scene("res://GameOverScene.tscn")




