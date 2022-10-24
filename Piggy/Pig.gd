extends Area2D


# Called every frame. 'delta' is the elapsed time since the previous frame.
const SPEED = 200

func _process(delta):
	if Input.is_action_pressed("ui_left"):
		move(-SPEED,0,delta)
	if Input.is_action_pressed("ui_right"):
		move(SPEED,0,delta)
	if Input.is_action_pressed("ui_up"):
		move(0,-SPEED,delta)
	if Input.is_action_pressed("ui_down"):
		move(0,SPEED,delta)
	
func move(x,y,delta):
	position.x += (x*delta)
	position.y += (y*delta)
	
