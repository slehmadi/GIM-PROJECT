extends Panel

func _on_Button_pressed():
	Global.time = 0
	get_tree().change_scene("res://src/Levels/level1.tscn")

func _ready():
	Global.time += 1
	Global.time -= 1
	
func _process(_delta):
	var hours = ("%d" % ((Global.best/360000) % 360000))
	var minutes = ("%02d" % ((Global.best/6000) % 6000))
	var seconds = ("%02d" % ((Global.best/100) % 100))
	$Label.text = "Best Time: " + hours+":"+minutes+":"+seconds+":"+str("%02d" % (Global.best%100)) 

