extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Dialogic.signal_event.connect(_on_dialogic_signal)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_area_2d_body_entered(body: Node2D) -> void:
	var 屏幕大小 = get_viewport_rect().size
	var a=get_node("Area2D")
	var timeline_name = "timeline"  # 你的 Timeline 名称
	var dialog = Dialogic.start(timeline_name)
	add_child(dialog)
	
	#
	# Godot 4 专用方式：等待 dialogic_signal 事件
	# 随机坐标（x和y都随机）
	#a.position = Vector2(
	#	randf() * 屏幕大小.x,  # 随机x
	#	randf() * 屏幕大小.y   # 随机y
	
	pass # Replace with function body.
	
func _on_dialogic_signal(argument:String):
	if argument == "activate_something":
		print('9')
		get_tree().change_scene_to_file("res://tscn/gameover.tscn")
		pass
	pass
	
