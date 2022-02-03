extends Area2D

export(NodePath) var counter_path
onready var counter = get_node(counter_path)
var level_name

# Called when the node enters the scene tree for the first time.
func _ready():
	level_name = get_tree().get_current_scene().get_name()
	

#func _process(delta):
#	pass


func _on_Finish_body_entered(body):
	match level_name:
		"level1":
			get_tree().change_scene("res://src/Levels/level2.tscn")
		_:
			return
