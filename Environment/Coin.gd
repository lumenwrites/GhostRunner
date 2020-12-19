extends Area2D


func _on_Coin_body_entered(body):
	if body is Player:
		$CoinSound.play()
		$"../HUD".increment_score()
		move_coin()

func move_coin():
	var margin = 64+16
	var pos_x = rand_range(margin, OS.get_window_safe_area().size.x - margin)
	var pos_y = rand_range(margin, OS.get_window_safe_area().size.y - margin)
	var random_pos = Vector2(pos_x,pos_y)
	global_position = random_pos
