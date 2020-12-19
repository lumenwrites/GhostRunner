extends KinematicBody2D

class_name Ghost

var speed = 350
var vel = Vector2(250, 250)

func _ready():
	randomize()
	var random_speed_x = rand_range(-speed,speed)
	var random_speed_y = rand_range(-speed,speed)
	vel = Vector2(random_speed_x,random_speed_y)
	$AnimationPlayer.play("Spawn")

func _physics_process(delta):
	var collision = move_and_collide(vel * delta)
	if collision:
		vel = vel.bounce(collision.normal)
		var reflect = collision.remainder.bounce(collision.normal)
		move_and_collide(reflect)
		if collision.collider is Player:
			collision.collider.take_damage()
	$Sprite.flip_h = vel.x < 0
