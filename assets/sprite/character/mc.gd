extends KinematicBody2D

export (NodePath) var spawn_path
onready var spawn = get_node(spawn_path)

onready var anim = $AnimatedSprite
var velocity : Vector2
var axis : Vector2
var moveBy = 400
var gravity = 980
var jumpForce = -450
var moveAble
var alive


# Called when the node enters the scene tree for the first time.
func _ready():
	moveAble = 0
	alive = 1

func _process(delta):
	axis.x = 0
	if moveAble and alive:
		inputPlayer()
		playerAct(delta)
	elif !moveAble and alive:
		if is_on_floor() and alive:
			moveAble = 1
			spawn.spawnpoint = position
		elif !is_on_floor():
			anim.animation = "jumpDown"
			velocity.y = 300
			velocity = move_and_slide(velocity, Vector2(0, -1))
		
func inputPlayer():
	if Input.is_action_pressed("RIGHT"):
		if is_on_floor():
			axis.x += 0.7
		else:
			axis.x += 0.5
	if Input.is_action_pressed("LEFT"):
		if is_on_floor():
			axis.x -= 0.7
		else:
			axis.x -= 0.5
	if Input.is_action_pressed("JUMP") and is_on_floor():
		velocity.y = jumpForce

func playerAct(delta):
	if (axis.x):
		if is_on_floor() and !is_on_wall():
			anim.animation = "walk"
		#if is_on_floor() and is_on_wall():
		#	$AnimatedSprite.animation = "push"
		if !is_on_floor():
			jumpCondition()
		velocity.x =  lerp(velocity.x, axis.x * moveBy, 0.3)
		if (axis.x < 0):
			anim.flip_h = true
		if (axis.x > 0):
			anim.flip_h = false
	else:
		if is_on_floor():
			anim.animation = "idle"
		else:
			jumpCondition()
		velocity.x = lerp(velocity.x, 0, 0.1)
	
	velocity.y += gravity * delta
	velocity = move_and_slide(velocity, Vector2(0, -1))

func jumpCondition():
	if (velocity.y < 0):
		anim.animation = "jumpUp"
	else:
		anim.animation = "jumpDown"
