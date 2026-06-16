extends PanelContainer

@onready var label = $Label
@onready var ui = get_node("/root/Test/UI")
@export var button_create_spell: PanelContainer

var id: int

func _can_drop_data(at_position: Vector2, data: Variant) -> bool:
	return typeof(data) == TYPE_DICTIONARY and data.has("source")

func _drop_data(at_position: Vector2, data: Variant) -> void:
	var source = data["source"]
	var label_inventory = source.get_node("Label")
	if not label.text:
		label_inventory.text = str(int(label_inventory.text) - 1)
		id = data["id"]
		
	elif label.text && label.text != data["element"]:
		ui.labels[id].text = str(int(ui.labels[id].text)+1)
		id = data["id"]
		ui.labels[id].text = str(int(ui.labels[id].text)-1)
	label.text = data['element']

func _gui_input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		if label.text:
			ui.labels[id].text = str(int(ui.labels[id].text)+1)
			label.text = ''
