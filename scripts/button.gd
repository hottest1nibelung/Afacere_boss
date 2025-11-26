extends Button


@onready var main = get_parent().get_parent()
func _ready() -> void:
	process_mode = Node.PROCESS_MODE_ALWAYS


func restartGame():
	main.gameOver = false
	get_tree().paused = false
	visible = false
	get_tree().reload_current_scene()
func _process(delta: float) -> void:
	if main.gameOver and Input.is_action_just_pressed("jump"):
		restartGame()


func _on_pressed() -> void:
	restartGame()
	
