extends Label


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	process_mode = Node.PROCESS_MODE_ALWAYS
	Global.h_pressed.connect(update_quantis)
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
func update_quantis(current_message, message_showing):
	if not message_showing:
		text ="Quantis: " + current_message
	else:
		text = ""
