extends Node2D

onready var scoreboard = $CanvasLayer/Label
export var score = 0 
onready var timer = $Timer

func _ready():
	timer.connect("timeout", self, "on_timeout")

func _physics_process(_delta):
	scoreboard.text = str(score)

	
func on_timeout():
	score += 1

