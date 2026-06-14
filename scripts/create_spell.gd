extends HBoxContainer

@onready var infusion_ui = get_node("/root/Test/UI/BoxInfusion")
var inventaire_ouvert := false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	self.visible = false
	infusion_ui
	pass # Replace with function body.

func _input(_event):
	if Input.is_action_just_pressed("ouvrir_inventaire"):
		if inventaire_ouvert == false:
			self.visible = true
			inventaire_ouvert = true
			Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
		else:
			self.visible = false
			inventaire_ouvert = false
			Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

		
