extends KinematicBody2D

var body = preload("res://Body.tscn")
export var direction = Vector2(32,0)
export var snakeparts = []
var totalD = 0

func _ready():
	pass # Replace with function body.
	
func _process(delta):
	totalD+=delta
	if Input.is_action_pressed("ui_down"):
		direction = Vector2(0,32)
	if Input.is_action_pressed("ui_up"):
		direction = Vector2(0,-32)
	if Input.is_action_pressed("ui_left"):
		direction = Vector2(-32,0)
	if Input.is_action_pressed("ui_right"):
		direction = Vector2(32,0)
	if totalD<.4:
		return
	totalD=0
	var pos2 = position
	var collide = move_and_collide(direction)
	for i in range(snakeparts.size()-1,-1,-1):
		if i==0:
			snakeparts[0].translate(pos2-snakeparts[0].position)
		else:
			snakeparts[i].translate(snakeparts[i-1].position-snakeparts[i].position)
	if collide:
		for i in snakeparts.size():
			snakeparts[i].queue_free()
		snakeparts.clear()
		position = Vector2(16,16)
		direction = Vector2(32,0)
	pass
	
func _on_Timer_timeout():
	var part = body.instance()
	snakeparts.append(part)
	get_node("..").add_child(part)
	pass # Replace with function body.
