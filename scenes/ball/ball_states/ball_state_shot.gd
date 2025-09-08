class_name BallStateShot
extends BallState

func _enter_tree() -> void:
	if ball.velocity.x >= 0:
		animation_player.play("roll")
		animation_player.advance(0)
	else:
		animation_player.play_backwards("roll")
		animation_player.advance(0)

func _process(delta: float) -> void:
	ball.move_and_collide(ball.velocity * delta)
