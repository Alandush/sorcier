extends StaticBody3D

@export var id: int
var souris_dessus := false
var i := 0

@onready var ui = get_node("/root/Test/UI")

func _ready() -> void:
	mouse_entered.connect(_on_mouse_entered)
	mouse_exited.connect(_on_mouse_exited)
	
func _on_mouse_entered():
	souris_dessus = true

func _on_mouse_exited():
	souris_dessus = false
	print("souris partie")

func _input(_event):
	if Input.is_action_just_pressed("prendre_sort") && souris_dessus:
		i += 1
		ui.labels[id].text = str(i)
