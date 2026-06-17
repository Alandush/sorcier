extends PanelContainer

var element_magic
var create_spell_ui: VBoxContainer

func _ready() -> void:
	element_magic = get_node("/root/Test/Player/ElementMagic")
	create_spell_ui = get_node("/root/Test/UI/BoxCreateSpell")

func _gui_input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		var child = create_spell_ui.get_child_count()
		var id = create_spell_ui.box_spells.size()
		var count = 0; # on vérifie combien de cases n'ont pas d'élément
		for i in range(id):
			if not create_spell_ui.box_spells[i].text:
				count += count
				if count - id < 2: # si il n'y a pas au moins 2 cases avec un élément
					print('Pas assez de spell')
					return;
		for i in range(child):
			element_magic.used_combination[i] = create_spell_ui.box_spells[i].text
		print(element_magic.used_combination)
