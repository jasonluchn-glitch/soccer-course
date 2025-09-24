class_name PlayerStateBicycleKick
extends PlayerState

const BALL_HEIGHT_MIN := 5.0
const BALL_HEIGHT_MAX := 25.0
const BONUS_POWER := 2.0 

func _ready() -> void:
	animation_player.play("bicycle_kick")
	ball_area_detection_area.body_entered.connect(on_ball_entered.bind())

func on_ball_entered(contact_ball: Ball) -> void:
	if ball.can_air_connect(BALL_HEIGHT_MIN, BALL_HEIGHT_MAX):
		var destination := target_goal.get_random_target_postion()
		var direction := ball.position.direction_to(destination)
		contact_ball.shoot(direction * player.power)

func on_animation_complete() -> void:
	transition_state(Player.State.RECOVERING)
