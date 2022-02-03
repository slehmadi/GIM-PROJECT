extends Area2D

export(NodePath) var spawnpoint_path
onready var spawn = get_node(spawnpoint_path)

var beenHere = 0

func _ready():
	$AnimatedSprite.animation = "unsaved"

func _on_savepoints_body_entered(body):
	if $AnimatedSprite.animation == "unsaved":
		spawn.spawnpoint = body.position
		$AnimatedSprite.animation = "saved"
