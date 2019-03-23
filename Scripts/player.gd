extends KinematicBody2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
export (int) var run_speed = 100
export (int) var jump_speed = -400
export (int) var gravity = 1200

var velocity = Vector2()
var jumping = false

func get_input():
    velocity.x = 0
    var right = Input.is_action_pressed('ui_right')
    var left = Input.is_action_pressed('ui_left')
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
