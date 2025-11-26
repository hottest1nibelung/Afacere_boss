extends Node2D

@onready var camera: Camera2D = $Parallax2D/Camera2D
@onready var bird: CharacterBody2D = $Bird
@onready  var viewport = get_viewport_rect().size
@onready var enemy_spawner: Timer = $enemySpawner
@onready var label: Label = $CanvasLayer/Label
@onready var cash_spawner: Timer = $cashSpawnertimer
@onready var high_score_label: Label = $CanvasLayer/highScore_label
@onready var quantis_label: Label = $CanvasLayer/quantis_label

@onready var cladire_spawner: Node2D = $cladireSpawner
@onready var suitcase_spawner: Node2D = $suitcaseSpawner
@onready var excel_spawner: Node2D = $excelSpawner
var enemies
var score = 0
var obstacles = []
var gameOver
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if Global.message_showing:
		Global.current_message_index += 1
		Global.message_showing = false
	$Parallax2D/Camera2D/music.play(randi_range(2, 100))
	gameOver = false;
	enemies = [cladire_spawner, suitcase_spawner, excel_spawner]
	cash_spawner.wait_time = randf_range(2.0, 5.0)
	cash_spawner.start()
	high_score_label.text = "Scor record: " + str(Global.high_score)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	camera.position.x = bird.position.x + viewport.x/3
	score += int(bird.SPEED/100)
	label.text = "Scor: " + str(score)
	if score > Global.high_score:
		Global.high_score = score
		
func _on_enemy_spawner_timeout() -> void:
	var enemy = enemies[randi_range(0, len(enemies)-1)]
	enemy.spawn()
	if enemy == excel_spawner:
		enemy_spawner.wait_time = randf_range(2.0, 3.0)
	else:
		enemy_spawner.wait_time = randf_range(1.0, 2.0)
		
func _on_cash_spawnertimer_timeout() -> void:
	$cashSpawnPoint.spawn()


		
		
