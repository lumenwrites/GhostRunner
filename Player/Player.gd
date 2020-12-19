extends KinematicBody2D
class_name Player

var speed = 150
var friction = 0.85
var vel = Vector2()

func _physics_process(delta):
	if Input.is_action_pressed("right"):
		vel.x += speed
	if Input.is_action_pressed("left"):
		vel.x -= speed
	if Input.is_action_pressed("up"):
		vel.y -= speed
	if Input.is_action_pressed("down"):
		vel.y += speed
	
	vel = move_and_slide(vel)
	vel *= friction
	
	$Sprite.flip_h = vel.x < 0
	
	#Take damage when player collies with a ghost
	var slide_count = get_slide_count()
	if slide_count:
		var collision = get_slide_collision(slide_count - 1)
		if collision.collider.is_in_group("enemies"):
			take_damage()

func take_damage():
	get_tree().change_scene("res://UI/GameOver.tscn")
