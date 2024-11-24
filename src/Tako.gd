extends Area2D

const EXPLOSION_OBJ = preload("res://src/Explosion.tscn")

const MOVE_SPEED = 200

var _screen = Rect2()
var _velocity = Vector2()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	_screen = get_viewport_rect()
	
	_velocity.x = randf_range(-1, 1)
	_velocity.y = randf_range(-1, 1)
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position += _velocity * MOVE_SPEED * delta
	
	if position.x < 0:
		position.x = 0
		_velocity.x *= -1
	if position.y < 0:
		position.y = 0
		_velocity.y *= -1
	if position.x > _screen.size.x:
		position.x = _screen.size.x
		_velocity.x *= -1
	if position.y > _screen.size.y:
		position.y = _screen.size.y
		_velocity.y *= -1
	
	pass


func _on_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton:
		if event.is_pressed():
			var explosion = EXPLOSION_OBJ.instantiate()
			explosion.position = position
			get_tree().root.add_child(explosion)

			queue_free()  # オブジェクトを削除する
	pass # Replace with function body.
