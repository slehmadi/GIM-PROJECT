extends Panel

export(NodePath) var timer_path
onready var timer = get_node(timer_path)

export(NodePath) var mc_path
onready var mc = get_node(mc_path)

onready var counter = $counter
var hours
var minutes
var seconds
var stopCond

# Called when the node enters the scene tree for the first time.
func _ready():
	hide()
	counter.text = "0:00:00:00"
	timer.set_wait_time(0.01)
	stopCond = 0

func _process(delta):
	if mc.moveAble and !stopCond:
		timer.start()

func Timer_timeout():
	Global.time += 1
	hours = ("%d" % ((Global.time/360000) % 360000))
	minutes = ("%02d" % ((Global.time/6000) % 6000))
	seconds = ("%02d" % ((Global.time/100) % 100))
	counter.text = hours+":"+minutes+":"+seconds+":"+str("%02d" % (Global.time%100))
	if stopCond == 1:
		timer.stop()
		Global.best = Global.bestTime(Global.time)

func _on_Button_pressed():
	get_tree().change_scene("res://main.tscn")
