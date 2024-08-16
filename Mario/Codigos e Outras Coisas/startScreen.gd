extends Control

func _ready():
	$controls/Fase1.grab_focus()

func _on_Fase1_pressed():
	get_tree().change_scene("res://Levels/LevelGiovanni.tscn")

func _on_Fase2_pressed():
	get_tree().change_scene("res://Levels/LevelFernanda.tscn")
	
func _on_Fase3_pressed():
	get_tree().change_scene("res://Levels/LevelCarlos.tscn")
	
func _on_Fase4_pressed():
	get_tree().change_scene("res://Levels/LevelGuilherme.tscn")
	
func _on_quitBtn_pressed():
	get_tree().quit()
