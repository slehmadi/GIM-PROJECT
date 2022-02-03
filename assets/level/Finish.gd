extends Area2D

export(NodePath) var counter_path
onready var counter = get_node(counter_path)

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

#func _process(delta):
#	pass


func _on_Finish_body_entered(body):
	counter.stopCond = 1
	counter.show()
