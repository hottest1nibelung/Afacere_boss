extends Node2D


@onready var suitcaseScene = load("res://scenes/suitcase.tscn")
func _ready() -> void:
	pass # Replace with function body.
	
func spawn():
	var suitCase = suitcaseScene.instantiate()
	add_sibling(suitCase)
	suitCase.global_position.x = $"../Parallax2D/Camera2D".global_position.x + get_viewport_rect().size.x + 100
	suitCase.global_position.y = randf_range(212.0, 744.0)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
