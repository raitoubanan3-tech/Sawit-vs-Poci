extends Area2D
var koin_tujuan
var sudah_disentuh = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	koin_tujuan = get_tree().get_nodes_in_group("label_koin")
	#get_tree().create_timer(7).timeout
	#queue_free()
func collect():
	sudah_disentuh = 1
	GLOBAL.koin += 10
	print(GLOBAL.koin)
	if koin_tujuan.size() > 0 :
		var pos_tujuan = koin_tujuan[0]
		var tween = create_tween()
		tween.tween_property(self, "position", pos_tujuan.position, 0.3)
		tween.tween_callback(queue_free)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	$Sprite2D/Sprite2D3.rotation_degrees += 10 * delta


func _on_button_mouse_entered() -> void:
	if sudah_disentuh == 0:
		collect()
	
	#queue_free()


func _on_timer_timeout() -> void:
	queue_free()
