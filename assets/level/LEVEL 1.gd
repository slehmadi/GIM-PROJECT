extends Node2D

func _ready():
	print(Global.test)
	Global.point += 1
	print(Global.point)
	print(Global.time)


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

