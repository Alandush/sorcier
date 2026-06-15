extends PanelContainer

@onready var label = $Label

func _can_drop_data(at_position: Vector2, data: Variant) -> bool:
	return typeof(data) == TYPE_DICTIONARY and data.has("source")

func _drop_data(at_position: Vector2, data: Variant) -> void:
	if not label || label.text != data["element"]:
		var source = data["source"]
		var label = source.get_node("Label")
		label.text = str(int(label.text) - 1)
	label.text = data['element']
