extends KinematicBody2D

var velocity = Vector2(100, 0)
var gravity = 800
var on_ground = false

func _ready():
	pass

func _physics_process(delta):
	var motion = Vector2(0, gravity * delta)
	
	if is_on_wall():
		velocity = -velocity
		motion.x = velocity.x
	else:
		motion.x = velocity.x
	
	motion = move_and_slide(motion, Vector2(0, -1))
	
	
	if is_on_floor():
		on_ground = true
	else:
		on_ground = false


func _on_hitKill_body_entered(body):
	if body.name == "Player":
		Global.score = 0
		get_tree().reload_current_scene()



func _on_killer_body_entered(body):
	if body.name == "Player":
		queue_free()
		Global.score += 1
