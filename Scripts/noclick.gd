extends StaticBody2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var entered = false

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass
	
func _process(delta):
	if entered:
		if Input.is_mouse_button_pressed(BUTTON_LEFT):
			print("no")

func _on_noclick_mouse_entered():
	print("no")

func _on_noclick_mouse_exited():
	entered = false # replace with function body
