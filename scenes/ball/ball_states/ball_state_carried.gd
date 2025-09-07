class_name BallStateCarried
extends BallState

const OFFSET_FROM_PLAYER :=  Vector2(10, 4) 

func _enter_tree() -> void:
	assert(carrier != null)

func _process(delta: float) -> void:
	ball.position = carrier.position + Vector2(carrier.heading.x * OFFSET_FROM_PLAYER.x, OFFSET_FROM_PLAYER.y)
	
	if carrier.velocity != Vector2.ZERO:
		if carrier.velocity.x >=0:
			animation_player.play("roll")
			animation_player.advance(0)
		else:
			animation_player.play_backwards("roll")
			animation_player.advance(0)
	else:
		animation_player.play("idle")
