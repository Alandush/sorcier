extends RigidBody3D

@export var combination: Array[String]
var player
var souris_dessus := false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	player = get_node("/root/Test/Player/ElementMagic")
	print(player)
	mouse_entered.connect(_on_mouse_entered)
	mouse_exited.connect(_on_mouse_exited)

func _on_mouse_entered():
	souris_dessus = true

func _on_mouse_exited():
	souris_dessus = false
	print("souris partie")

func _input(_event):
	if Input.is_action_just_pressed("prendre_sort") && souris_dessus:
		print(player.used_combination)
		player.used_combination = combination
