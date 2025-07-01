extends Node2D

@export var sb = 0
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var timeline_name = "timeline2"  # 你的 Timeline 名称
	var dialog = Dialogic.start(timeline_name)
	add_child(dialog)
	Dialogic.signal_event.connect(_on_dialogic_signal)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func _on_dialogic_signal(argument:String):
	if argument == "activate_something":
		var a=get_node("Coin3Woman")
		a.visible=false
		print('a')
		pass
	if argument == "over":
		get_tree().change_scene_to_file("res://tscn/gameover.tscn")
		pass
	if argument == "haha":
		#get_tree().change_scene_to_file("res://tscn/gameover.tscn")
		var d = get_node("Qq1751287905445")
		d.visible=true
		pass
	pass
	


func _on_area_2d_body_entered(body: Node2D) -> void:
	if sb ==0:
		var timeline_name = "timeline3"  # 你的 Timeline 名称
		var dialog = Dialogic.start(timeline_name)
		add_child(dialog)
		sb=1
		pass
	else:
		var l=get_node("Label")
		var a=get_node("Coin3Man")
		a.visible=false
		
		l.text="你过关"
		await get_tree().create_timer(2.0).timeout
	pass # Replace with function body.
