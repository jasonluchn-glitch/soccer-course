class_name BallStateCarried
extends BallState

const DRIBBLE_FREQUENCY := 10.0
const DRIBBLE_INTENSITY := 3.0
const OFFSET_FROM_PLAYER :=  Vector2(10, 4) 

var dribble_time := 0.0

func _enter_tree() -> void:
	assert(carrier != null)

func _process(delta: float) -> void:
	var vx := 0.0
	
	dribble_time += delta
	
	if carrier.velocity != Vector2.ZERO:
		if carrier.velocity.x != 0:
			vx = sin(dribble_time * DRIBBLE_FREQUENCY) * DRIBBLE_INTENSITY
		if carrier.velocity.x >= 0:
			animation_player.play("roll")
			animation_player.advance(0)
		else:
			animation_player.play_backwards("roll")
			animation_player.advance(0)
	else:
		animation_player.play("idle")
	
	ball.position = carrier.position + Vector2(vx + carrier.heading.x * OFFSET_FROM_PLAYER.x, OFFSET_FROM_PLAYER.y)
	
func forwards_backwards_movement() -> Vector2:
	var current_x := 0.0
	var range = 100
	if current_x < range:
		current_x += 10
	elif current_x > -range:
		current_x -= 10
	
	return Vector2(current_x, 0)
