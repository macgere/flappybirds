extends KinematicBody2D

const UP = Vector2.UP
const FLAP = -300
const MAXFALLSPEED = 300
const GRAVITY = 20
var Wall = preload("res://Wall.tscn")

var motion = Vector2()

func _physics_process(delta):
	
	motion.y += GRAVITY
	if motion.y > MAXFALLSPEED:
		motion.y = MAXFALLSPEED
	
	if Input.is_action_just_pressed("flap"):
		motion.y = FLAP
	
	motion = move_and_slide(motion, UP)

func Wall_reset():
	var Wall_instance = Wall.instance()
	Wall_instance.position = Vector2(900, rand_range(-80,80))
	get_parent().call_deferred("add_child", Wall_instance)
	
func _on_Resetter_body_entered(body):
	if body.name == "Walls":
		body.queue_free()
		Wall_reset()

func _on_Area2D_body_entered(body):
	if body.name == "Walls":
		get_tree().change_scene("res://GameOverMenu.tscn")
