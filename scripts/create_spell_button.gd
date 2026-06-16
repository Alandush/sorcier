extends PanelContainer

var element_magic
var create_spell_ui: VBoxContainer
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	element_magic = get_node("/root/Test/Player/ElementMagic")
	create_spell_ui = get_node("/root/Test/UI/BoxCreateSpell")

func _gui_input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		var child = create_spell_ui.get_child_count()
		for i in range(child):
			element_magic.used_combination[i] = create_spell_ui.box_spells[i].text
		print(element_magic.used_combination)
