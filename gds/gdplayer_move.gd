extends CharacterBody2D

const SPEED = 300.0
const JUMP_VELOCITY = -400.0
const FOOTSTEP_INTERVAL = 0.3

@onready var sprite = $M01
var footstep_timer = 0.0
var is_right_foot = false

func _physics_process(delta: float) -> void:
	# 统一输入处理（同时支持键盘和摇杆）
	var keyboard_input = Vector2(
		Input.get_action_strength("r") - Input.get_action_strength("l"),
		Input.get_action_strength("d") - Input.get_action_strength("u")
	)
	
	var joystick_input = Vector2(
		Input.get_action_strength("virtual_joystick_right") - Input.get_action_strength("virtual_joystick_left"),
		Input.get_action_strength("virtual_joystick_down") - Input.get_action_strength("virtual_joystick_up")
	)
	
	# 优先使用摇杆输入
	var direction = joystick_input if joystick_input.length() > 0.1 else keyboard_input
	velocity = direction.normalized() * SPEED if direction.length() > 0 else Vector2.ZERO
	
	# 动画逻辑（完全保留你的原始实现）
	var is_moving = direction.length() > 0.1
	if is_moving:
		# 更新角色朝向
		if abs(direction.x) > abs(direction.y):
			sprite.frame_coords.x = 1 if direction.x > 0 else 3
		else:
			sprite.frame_coords.x = 0 if direction.y > 0 else 2
		
		# 步伐动画
		footstep_timer += delta
		if footstep_timer >= FOOTSTEP_INTERVAL:
			footstep_timer = 0.0
			is_right_foot = !is_right_foot
			sprite.frame_coords.y = 1 if is_right_foot else 2
	else:
		sprite.frame_coords.y = 0
		footstep_timer = 0.0
	
	move_and_slide()

# 屏蔽键盘输入（仅移动端生效）
func _unhandled_input(event):
	if event is InputEventKey and OS.has_feature("mobile"):
		get_viewport().set_input_as_handled()
