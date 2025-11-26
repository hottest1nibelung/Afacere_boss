extends CharacterBody2D

var SPEED = 700.0
const JUMP_VELOCITY = -400.0
const GRAVITY = 15.0

func die():
	get_parent().gameOver = true
	$AnimatedSprite2D.play("dead")
	get_parent().get_node('CanvasLayer/Button').visible = true
	get_tree().paused = true
func _physics_process(delta: float) -> void:
	if Input.is_action_just_pressed("jump") and self.position.y > 0:
		velocity.y = JUMP_VELOCITY
	else:
		velocity.y += GRAVITY
	velocity.x = SPEED
	if position.y > 904.0:
		die()
	move_and_slide()


func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.is_in_group("enemy"):
		die()
	if area.is_in_group("cash"):
		$sound_coin_collect.play()
		get_parent().score *= 2
		SPEED += 20
		area.queue_free()
