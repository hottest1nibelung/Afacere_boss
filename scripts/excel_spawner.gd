extends Node2D

@onready var excelScene = load("res://scenes/excel.tscn")
func _ready() -> void:
	pass # Replace with function body.

func spawn():
	var excel = excelScene.instantiate()
	add_child(excel)
	excel.global_position.x = $"../Parallax2D/Camera2D".global_position.x + get_viewport_rect().size.x + 100
	excel.global_position.y  = randf_range(161.0, 601.0)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
