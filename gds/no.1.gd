extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var c=get_node("Qq1751287905445")
	var d=get_node("Qq1751288112378")
	var b=get_node("Coin2")
	await get_tree().create_timer(5.0).timeout
	c.visible=true
	d.visible=true
	d.position.x=b.position.x
	d.position.y=b.position.y
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var a=get_node("CharacterBody2D")
	var b=get_node("Coin2")
	var c=get_node("Qq1751287905445")
	if(c.visible!=true):
		b.position.x=a.position.x+100
		b.position.y=a.position.y+100
		
	pass


func _on_area_2d_body_entered(body: Node2D) -> void:
	var a=get_node("Label")
	var b=get_node("Coin2")
	var d=get_node("Qq1751288112378")
	b.visible=false
	d.visible=false
	a.text="你过关"
	await get_tree().create_timer(2.0).timeout
	get_tree().change_scene_to_file("res://tscn/no.2.tscn")
	pass # Replace with function body.
