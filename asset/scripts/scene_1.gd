extends Node2D #scene utama

@onready var tilemap = $background/TileMapLayer
#var petak_terisi : Array[Vector2i] = [] 

func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT: 
		if tilemap == null: 
			return
		var pos_sentuh_global = get_global_mouse_position() #ngubah posisi sentuhan jadi variabel
		var koordinat_ubin = tilemap.local_to_map(tilemap.to_local(pos_sentuh_global)) #ngubah kordinat jadi petak ubin
		print(koordinat_ubin)
		if event.pressed:
			if GLOBAL.kartu != 0 and not GLOBAL.ubin_yang_terisi.has(koordinat_ubin):
				var ubin_valid = tilemap.get_cell_source_id(koordinat_ubin) #cek bahwa petak yang disentuh ada lahannya/valid
				if ubin_valid != -1: # -1 artinya ubin ga diisi sama tilemap
					spawn_tanamam(koordinat_ubin) #ambil func sama ngasih var kordinat ubin
					

func spawn_tanamam(koordinat):
	var data = DATA_TANAMAN.data_tanaman[GLOBAL.kartu]
	var tanaman_baru = data["scene"].instantiate()
	var local_pos = tilemap.map_to_local(koordinat) #
	var posisi_spawn = tilemap.to_global(local_pos)
	tanaman_baru.global_position = posisi_spawn
	if "koordinat_saya" in tanaman_baru:
		tanaman_baru.koordinat_saya = koordinat
	add_child(tanaman_baru)
	GLOBAL.ubin_yang_terisi.append(koordinat)
	GLOBAL.kartu = 0
		
func _ready() -> void:
	pass #
func _process(delta: float) -> void:
	pass


func _on_timer_spawn_hantu_timeout() -> void:
	var jenis_musuh = 1
	var baris_acak = randi() % 5
	var data = DATA_TANAMAN.data_musuh[jenis_musuh]
	var koordinat_spawn = Vector2i(9, baris_acak)
	var local_pos = tilemap.map_to_local(koordinat_spawn)
	var posisi_spawn = tilemap.to_global(local_pos)
	var musuh_baru = data["scene"].instantiate()
	musuh_baru.global_position = posisi_spawn
	musuh_baru.position.y += 50
	add_child(musuh_baru)
