extends Control


func _ready():
	$CenterContainer/VBoxContainer/HBoxContainer/Score.text = str(G.score)
	$GameoverSound.play()

func _input(event):
	if Input.is_action_just_pressed("restart"):
		restart_game()
		
func _on_RestartButton_pressed():
	restart_game()
	
func restart_game():
	G.score = 0
	get_tree().change_scene("res://Environment/World.tscn")
