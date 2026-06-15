extends PanelContainer

var souris_dessus := false
@export var element: String
@export var id: int

func _get_drag_data(at_position: Vector2) -> Variant:
	var number = int($Label.text)
	print(number)
	if number > 0:
		var copie = duplicate()
		set_drag_preview(copie)
		return {"element": element, "source": self, "id": id}
	return null
