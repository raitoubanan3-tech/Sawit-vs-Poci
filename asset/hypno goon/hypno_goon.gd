extends Node2D
@export var speed = 500

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	$Sprite2D/Sprite2D2/Sprite2D/Sprite2D/wajah/Sprite2D6/Sprite2D6.rotation_degrees += speed * delta
	$Sprite2D/Sprite2D2/Sprite2D/Sprite2D/wajah/Sprite2D7/Sprite2D6.rotation_degrees += speed * delta


func _on_button_button_down() -> void:
	var tween = create_tween()
	tween.tween_property($Sprite2D/Sprite2D2, "scale:x", 1.1, 0.1)
	tween.tween_property($Sprite2D/Sprite2D2, "scale:y", 0.95, 0.1)
	tween.tween_interval(0.01)
	tween.tween_property($Sprite2D/Sprite2D2, "scale:y", 1.15, 0.15)
	tween.tween_property($Sprite2D/Sprite2D2, "scale:x", 1.0, 0.15)
	$AudioStreamPlayer2D.play()
	tween.tween_interval(0.1)
	tween.tween_property($Sprite2D/Sprite2D2, "scale:x", 1.1, 0.1)
	tween.tween_property($Sprite2D/Sprite2D2, "scale:y", 1.0, 0.15)
	tween.tween_interval(0.2)

	tween.tween_property($Sprite2D/Sprite2D2, "scale:x", 1.0, 0.5)
