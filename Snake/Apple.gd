extends Node2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
signal eaten
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _check_pos(headpos):
	if headpos == position:
		emit_signal("eaten")
	pass
