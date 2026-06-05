extends Control

@onready var kartu = preload("res://asset/scenes/kartu.tscn")
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var k = kartu.instantiate()
	$NinePatchRect/ScrollContainer/GridContainer.add_child(k)



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
