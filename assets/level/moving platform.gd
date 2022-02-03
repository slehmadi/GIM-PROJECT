extends KinematicBody2D

export(NodePath) var mc_path
onready var mc = get_node(mc_path)

onready var anim = $AnimationPlayer

func _ready():
	anim.stop()

func _process(delta):
	if mc.moveAble:
		anim.play("moving")
