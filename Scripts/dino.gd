extends Sprite

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var beautiful = load ("res://Assets/emotes/beautiful.png")
var music = load ("res://Assets/emotes/pipo-popupemotes005.png")
var stars = load ("res://Assets/emotes/pipo-popupemotes006.png")
var shootingstar = load("res://Assets/emotes/pipo-popupemotes006.png")
var heart = load("res://Assets/emotes/pipo-popupemotes009.png")
var blush = load("res://Assets/emotes/pipo-popupemotes011.png")
var irritated = load("res://Assets/emotes/pipo-popupemotes019.png")
var sleepy = load("res://Assets/emotes/pipo-popupemotes021.png")
var mad = load("res://Assets/emotes/pipo-popupemotes033.png")
var question = load("res://Assets/emotes/pipo-popupemotes003.png")

onready var emote = get_node("emote")

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	randomize()
	
	var temp = randi() % 10
	
	match temp:
    	1: emote.texture = beautiful
    	2: emote.texture = music
    	3: emote.texture = stars
    	4: emote.texture = shootingstar
    	5: emote.texture = heart
    	6: emote.texture = blush
    	7: emote.texture = irritated
    	8: emote.texture = sleepy
    	9: emote.texture = mad
    	10: emote.texture = question

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass

func _on_Area2D_area_entered(area):
	if (!area.is_in_group("player") && area.is_in_group("dino")):
		print(area.get_parent().get_node("emote"))
		emote.texture = area.get_parent().get_node("emote").texture
	
