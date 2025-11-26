extends Node2D

@onready var cashScene = load("res://scenes/cash.tscn")
func _ready() -> void:
	pass # Replace with function body.

func spawn():
	var cash = cashScene.instantiate()
	add_sibling(cash)
	cash.global_position.x = $"../Parallax2D/Camera2D".position.x + get_viewport_rect().size.x + 200
	cash.global_position.y = randf_range(83.0, 815.0)
func _process(delta: float) -> void:
	pass
