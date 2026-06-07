extends Control

@onready var kartu = preload("res://asset/scenes/kartu.tscn")
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	spawn_kartu()
	
func spawn_kartu():
	
	for i in DATA_TANAMAN.data_tanaman.size():
		var k = kartu.instantiate()
		k.id_kartu = i + 1
		$NinePatchRect/ScrollContainer/GridContainer.add_child(k)
		
		


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
