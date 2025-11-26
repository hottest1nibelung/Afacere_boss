extends Node

var quantis_label
@onready var main = get_tree().root.get_node("main")
var high_score = 0
var current_message_index = 0
var message_showing = false
signal h_pressed(msj, msj_showing)
var messages = ["Nu te teme de viteză! Fiecare bancnotă dublează scorul, dar te accelerează. High Risk, High Reward! Fii agresiv, dar menține calmul.", "Din observatiile mele, o strategie optima este sa ramai la inaltimea maxima",
"Inca un nivel, apoi du-te sa faci un dus!",
"Cand ai baut apa ultima data?",
"Bateria e pe rosu! Fa un save game, opreste-te si da-i corpului tau o postura de castigator! Mergi la dus sa iti refaci mana si stamina!"]
func _ready() -> void:
	process_mode = Node.PROCESS_MODE_ALWAYS
func toggle_message():
	if not message_showing:
		h_pressed.emit( messages[current_message_index], message_showing)
		message_showing = true
	else:
		h_pressed.emit(messages[current_message_index], message_showing)
		current_message_index += 1
		current_message_index %= len(messages)
		message_showing = false
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("h"):
		toggle_message()
