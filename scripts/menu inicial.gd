extends Node2D

var change_scene1 = load("res://niveles/nivel 1.tscn")
var change_scene2 = load("res://niveles/nivel 2.tscn")
var change_scene3 = load("res://niveles/nivel 3.tscn")

	

func _on_button_pressed():
	
	get_tree().change_scene_to_packed(change_scene1)
	pass # Replace with function body.



func _on_button_2_pressed():
	get_tree().change_scene_to_packed(change_scene2)
	pass # Replace with function body.



func _on_button_3_pressed():
	get_tree().change_scene_to_packed(change_scene3)
	pass # Replace with function body.
