extends Area3D


@export var vitesse: float = 10.0
@export var force: float = 8.0

func _ready():
	await get_tree().create_timer(2.0).timeout
	queue_free()
	
func _process(delta):
	global_position += -global_transform.basis.z * vitesse * delta

func _physics_process(delta):
	for body in get_overlapping_bodies():
		var direction = (body.global_position - global_position).normalized()

		if body is RigidBody3D:
			body.apply_central_force(direction * force * 100)

		elif body is CharacterBody3D:
			body.velocity += direction * force
			body.move_and_slide()
