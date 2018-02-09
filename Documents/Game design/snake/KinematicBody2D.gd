extends KinematicBody2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var snakepart=preload("res://snakepart.tscn")
var spritesize=50
var children=[0,0,0]
var direction=Vector2(0,spritesize)
func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass
var totalD=0
var once=true
func _process(delta):
	if once:
		once=false
		var part= snakepart.instance();
		part.position=self.position-direction
		children[0]=part
		var part2= snakepart.instance();
		part2.position=self.position-direction-direction
		children[1]=part2
		var part3= snakepart.instance();
		part3.position=self.position-direction-direction-direction
		children[2]=part3
		get_node("..").add_child(part)
		get_node("..").add_child(part2)
		get_node("..").add_child(part3)
	totalD+=delta
	if Input.is_action_pressed("ui_up"):
		direction =Vector2(0,-spritesize)
	if Input.is_action_pressed("ui_down"):
		direction=Vector2(0,spritesize)
		
	if Input.is_action_pressed("ui_left"):
		direction=Vector2(-spritesize,0)
		
	if Input.is_action_pressed("ui_right"):
		direction=Vector2(spritesize,0)
	if totalD<.4:
		return
	totalD=0
	var pos2=position
	translate(direction)
	for i in range(children.size()-1,-1,-1):
		if i==0:
			children[0].translate(pos2-children[0].position)
		else:
			children[i].translate(children[i-1].position-children[i].position)
		
	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass
