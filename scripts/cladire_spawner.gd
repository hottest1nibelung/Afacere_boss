extends Node2D


@onready var cladireScene = load("res://scenes/cladire.tscn")
func _ready() -> void:
	pass # Replace with function body.

func spawn():
	var cladire = cladireScene.instantiate()
	add_sibling(cladire)
	cladire.global_position.x = $"../Parallax2D/Camera2D".global_position.x + get_viewport_rect().size.x + 100
	cladire.global_position.y = randf_range(731.0, 971.0)
