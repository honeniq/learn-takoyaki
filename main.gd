extends Node2D

@onready var _label = $Label

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	var cnt = 0
	for child in get_children():
		if "Tako" in child.name:
			cnt += 1
			
	if cnt == 0:
		_label.visible = true
	pass
