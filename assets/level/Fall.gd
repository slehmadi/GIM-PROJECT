extends Area2D

export(NodePath) var mc_path
onready var mc = get_node(mc_path)

var spawnpoint : Vector2

func _ready():
	pass

func _on_Fall_body_entered(body):
	body.position = spawnpoint
