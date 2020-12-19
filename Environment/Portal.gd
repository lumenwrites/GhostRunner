extends Position2D

var GHOST = preload("res://Enemies/Ghost.tscn")

func _ready():
	$AnimationPlayer.play("Spin")
	
func _on_SpawnTimer_timeout():
	var instance = GHOST.instance()
	instance.global_position = global_position
	get_parent().add_child(instance)
