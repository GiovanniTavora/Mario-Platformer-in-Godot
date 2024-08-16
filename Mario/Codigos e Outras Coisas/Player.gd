extends KinematicBody2D

export var gravity = 5
export var movement = Vector2()
export var walk_speed = 100
export var jump_force = 245
export var dash_duration = 0.2  # Duração do dash em segundos
onready var dash_timer = $dash_timer

func _physics_process(delta):
	if not is_on_floor():
		movement.y += gravity
	var hor_axis = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	movement.x = hor_axis * walk_speed

	move_and_slide(movement, Vector2.UP)
	update_animation()

func start_dash(dur):
	dash_timer.wait_time = dur
	dash_timer.start()

func is_dashing():
	return !dash_timer.is_stopped()

func update_animation():
	if movement.x > 0:
		$AnimatedSprite.scale.x = abs($AnimatedSprite.scale.x)
	elif movement.x < 0:
		$AnimatedSprite.scale.x = -abs($AnimatedSprite.scale.x)

	if is_on_floor():
		if abs(movement.x) > 0:
			$AnimatedSprite.play("walk")
		else:
			$AnimatedSprite.play("idle")
	else:
		$AnimatedSprite.play("jump")
