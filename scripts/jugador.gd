extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(delta):
	# Add the gravity.
	if $Camera2D/Sprite2D.texture == preload ("res://sprites de vida/Sin vida.png"):
		get_tree().reload_current_scene()
		pass
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle Jump.
	if Input.is_action_just_pressed("brinco") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("izquierda", "derecha")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
var contador = 0
var muerte = false
var texturas = [
preload("res://sprites de vida/media vida.png"),
preload("res://sprites de vida/Sin vida.png")
]
func cambio_sprite():
	
	$Camera2D/Sprite2D.texture = texturas[contador % texturas.size()]
	contador +=1
func _on_pinchos_body_entered(body):
	if $Camera2D/Sprite2D.texture  != preload("res://sprites de vida/Sin vida.png"):
		if body == $"." :
			cambio_sprite()
		else:
			muerte=true
			get_tree().set("muerte", true)

func _on_area_2d_body_entered(body):
	if body== $"." :
		var change_scene1 = load("res://niveles/nivel 2.tscn")
		get_tree().change_scene_to_packed(change_scene1)
	pass # Replace with function body.
