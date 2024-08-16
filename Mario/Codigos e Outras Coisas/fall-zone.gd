extends Area2D

func _on_fallzone_body_entered(body):
	if body.name == "Player":
		Global.score = 0
		get_tree().reload_current_scene()
