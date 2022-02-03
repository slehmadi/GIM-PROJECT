extends Area2D

export(NodePath) var mc_path
onready var mc = get_node(mc_path)

export(NodePath) var spawn_path
onready var spawn = get_node(spawn_path)


func _ready():
	$AnimationPlayer.play("move")
	

func _on_spikes_body_entered(body):
	if body.is_in_group("player"):
		mc.alive = 0
		mc.anim.animation = "dead"


