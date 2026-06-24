extends Node3D

@export var used_combination: Array[String]
var elements: Array[String] = ['eau','terre','feu','air']
@export var vent_scene: PackedScene
	
func _input(_event):
	if Input.is_action_just_pressed("lancer_sort"):
		print('Ja lance le sort.')
		if used_combination.size() == 2:
			# Pour les sorts à deux combinaisons
			# 0 = EAU
			if used_combination == [elements[0], elements[0]]: # EAU ; EAU
				print('VAGUE')
			elif used_combination == [elements[0], elements[1]]: # EAU ; TERRE
				print('BOUE')
			elif used_combination == [elements[0], elements[2]]: # EAU ; FEU
				print('Vapeur d\'eau')
			elif used_combination == [elements[0], elements[3]]: # EAU ; AIR
				print('Nuage')
			# 1 = TERRE
			elif used_combination == [elements[1], elements[0]]: # TERRE ; EAU
				print('Poison')
			elif used_combination == [elements[1], elements[1]]: # TERRE ; TERRE
				print('Plateforme')
			elif used_combination == [elements[1], elements[2]]: # TERRE ; FEU
				print('Roche volcanique')
			elif used_combination == [elements[1], elements[3]]: # TERRE ; AIR
				print('Sable')
			# 2 = FEU
			elif used_combination == [elements[2], elements[0]]: # FEU ; EAU
				print('Explosion')
			elif used_combination == [elements[2], elements[1]]: # FEU ; TERRE
				print('Cendre')
			elif used_combination == [elements[2], elements[2]]: # FEU ; FEU
				print('Flamme')
			elif used_combination == [elements[2], elements[3]]: # FEU ; AIR
				print('Lance-flamme')
			# 3 = AIR
			elif used_combination == [elements[3], elements[0]]: # AIR ; EAU
				print('Arroseur')
			elif used_combination == [elements[3], elements[1]]: # AIR ; TERRE
				print('Lance platforme')
			elif used_combination == [elements[3], elements[2]]: # AIR ; FEU
				print('Fumée')
			elif used_combination == [elements[3], elements[3]]: # AIR ; AIR
				# on l'ajoute à la scène
				var vent = vent_scene.instantiate()
				get_parent().add_child(vent)
				var cam = get_viewport().get_camera_3d()    # la caméra active
				var direction = -cam.global_transform.basis.z    # l'avant de la caméra
				vent.global_position = global_position + direction * 4
				vent.global_transform.basis = cam.global_transform.basis
				print('Bourasque')
		else:
			print('Il n\'y a pas deux éléments.')
