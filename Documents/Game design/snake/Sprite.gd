extends Sprite
var array=load("Array")
# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	var input = [0, -3 ,5, -4, -2, 3, 1, 0]
	var interm=Array()
	interm.append([0,0])
	var total=0
	for i in input:
		total+=i
		interm.append([total,0])
	for i in range(interm.size()-1,-1,-1):
		interm[i][1]=
#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass
