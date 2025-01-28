extends Area2D

signal load_level

var	access_to

func	define_access(level):
	print("new access to: ", level)
	access_to = level

func _on_body_entered(body: Node2D) -> void:
	emit_signal("load_level", access_to)
