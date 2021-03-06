extends Control

onready var global = get_node("/root/Global")
onready var GameNode =  get_node("/root/Game")
onready var Game = load("res://Game.tscn")
onready var Level2 = load("res://Level/Level2.tscn")

func _ready():
	update_score(0)
	update_health(0)


func update_score(s):
	global.score += s
	$Score.text = "Score: " + str(global.score)
	if global.score >= 100 and global.level != 2:
# warning-ignore:return_value_discarded
		queue_free()
		get_tree().change_scene("res://Level/Level2.tscn")
		#get_tree().change_scene_to(Level2)

func update_health(h):
	global.health += h
	$Health.text = "Health: " + str(global.health)
	if global.health <= 0:
# warning-ignore:return_value_discarded
		get_tree().change_scene("res://Menu/Die.tscn")
