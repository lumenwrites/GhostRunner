extends CanvasLayer

func increment_score():
	G.score += 1
	$Score.text = str(G.score)
