extends Area2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var entered = false
onready var emote
onready var player = get_node("../player")
onready var timer = get_node("../not_allowed")

var what = load("res://Assets/emotes/surprise.png")
var temp
var temp_pos

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

func _process(delta):
	emote = get_node("../player/dino/emote")
	temp = emote.texture
	temp_pos = player.position
	
func _input(event):
	if (event.is_action("click") && !entered):
		player.position = get_global_mouse_position()
	elif (event.is_action("click") && entered):
		player.position = temp_pos
		emote.texture = what
		emote.show()
		timer.start()

func _on_noclick_mouse_entered():
	entered = true
	print(entered)

func _on_noclick_mouse_exited():
	entered = false
	print(entered)

func _on_not_allowed_timeout():
	emote.hide()
	emote.texture = temp

