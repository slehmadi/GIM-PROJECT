extends AudioStreamPlayer

export(int) var base_volume_db = -14

func _ready():
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Master"), base_volume_db)
	

