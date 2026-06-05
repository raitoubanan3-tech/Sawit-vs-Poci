extends CharacterBody2D

var koordinat_saya 
@onready var koin_scene = preload("res://asset/scenes/koin.tscn")


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print(koordinat_saya)
	pass # Replace with function body.

func hasilkan_koin():
	$Sprite2D/Sprite2D.self_modulate = Color(1.59, 1.196, 0.727, 1.0)
	var spawn_koin = koin_scene.instantiate()
	spawn_koin.global_position = position 
	add_sibling(spawn_koin)
	await get_tree().create_timer(1).timeout
	$Sprite2D/Sprite2D.self_modulate = Color(1.0, 1.0, 1.0, 1.0)
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_timer_timeout() -> void:
	hasilkan_koin()
