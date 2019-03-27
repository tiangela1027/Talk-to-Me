extends KinematicBody2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
export (int) var run_speed = 100
export (int) var jump_speed = -250
export (int) var gravity = 750

var velocity = Vector2()
var target = Vector2()
var jumping = false
var entered = false

onready var timer = get_node("Timer")
onready var emote = get_node("dino/emote")

func _process(delta):	
    var up = Input.is_action_pressed('ui_up')
    if up and !emote.is_visible(): 
        emote.show()
        timer.start()

func get_input():
    velocity.x = 0
    var right = Input.is_action_pressed('ui_right')
    var left = Input.is_action_pressed('ui_left')
	
    var up = Input.is_action_pressed('ui_up')
	
    var jump = Input.is_action_just_pressed('ui_select')
	
    var sprite = get_node("dino")
    var anim = get_node("dino/AnimationPlayer")

    if jump and is_on_floor():
        jumping = true
        velocity.y = jump_speed
    else:
        if right:
            sprite.flip_h = false
            anim.set_current_animation("walk")
            velocity.x += run_speed
        elif left:
            sprite.flip_h = true
            anim.set_current_animation("walk")
            velocity.x -= run_speed
        else:
            anim.set_current_animation("idle")
		

func _physics_process(delta):
    get_input()
    velocity.y += gravity * delta
    if jumping and is_on_floor():
        jumping = false
    velocity = move_and_slide(velocity, Vector2(0, -1))


func _on_Timer_timeout():
	emote.hide()

func _on_noclick_mouse_entered():
	entered = true

func _on_noclick_mouse_exited():
	entered = false
