extends Sprite2D

const SPEED = 37  # 37パターンで1ループ

var _pasttime = 0.0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	_pasttime += delta
	
	frame = int(_pasttime * SPEED * 2)
	if frame >= 38:
		queue_free()
	
	pass
