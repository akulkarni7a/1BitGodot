extends Area2D

var speed = 150
const Bullet = preload("res://Bullet.tscn")

func _ready():
	pass # Replace with function body.

func _process(delta):
	if Input.is_action_pressed("ui_up"):
		move(0,-speed,delta)
	if Input.is_action_pressed("ui_down"):
		move(0,speed,delta)
	
	if Input.is_action_just_pressed("ui_select"):
		var bullet = Bullet.instance()
		self.add_child(bullet)

func move(x,y,delta):
	position.x += x * delta
	position.y += y * delta
