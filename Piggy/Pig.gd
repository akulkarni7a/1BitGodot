extends Area2D


# Called every frame. 'delta' is the elapsed time since the previous frame.
export(int) var SPEED = 200

onready var animationPlayer = $AnimationPlayer
onready var sprite = $Sprite


func _process(delta):
	if Input.is_action_pressed("ui_left"):
		move(-SPEED,0,delta)
		sprite.flip_h = true
	if Input.is_action_pressed("ui_right"):
		move(SPEED,0,delta)
		sprite.flip_h = false
	if Input.is_action_pressed("ui_up"):
		move(0,-SPEED,delta)
	if Input.is_action_pressed("ui_down"):
		move(0,SPEED,delta)
	
func move(x,y,delta):
	position.x += (x*delta)
	position.y += (y*delta)
	animationPlayer.play("Run")



func _on_Pig_area_entered(area):
	area.queue_free()
	scale *= 1.1
