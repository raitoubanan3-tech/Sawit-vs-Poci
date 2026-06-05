extends Area2D
var id_kartu = 1

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	data_kartu()
	$Sprite2D/ProgressBar.visible = false

func data_kartu():
	if id_kartu != 0:
		var data = DATA_TANAMAN.data_tanaman[id_kartu]
		$Sprite2D/Sprite2D3.texture = load(data["gambar_kartu"])
		$Sprite2D/Harga.text = data["harga_kartu"]
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if GLOBAL.kartu == id_kartu:
		$Sprite2D.scale = Vector2(1.15, 1.15)
	else:
		$Sprite2D.scale = Vector2(1.0, 1.0)


func _on_button_button_up() -> void:
	if GLOBAL.kartu != id_kartu:
		GLOBAL.kartu = id_kartu
	else:
		GLOBAL.kartu = 0
	print(GLOBAL.kartu)
