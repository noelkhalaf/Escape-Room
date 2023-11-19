extends Area2D

var vault_closed_t = preload("res://assets/images/vault.png")
var vault_open_t = preload("res://assets/images/vault-open.png")

@onready var vault_s = $VaultImage
@onready var handle_s = $Handle

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
		if vault_s.get_texture() == vault_closed_t:
			open_vault()
		else:
			close_vault()

func open_vault():
	vault_s.set_texture(vault_open_t)
	handle_s.position.x -= Global.VAULT_HANDLE_POS_X_DIFF
	handle_s.position.y -= Global.VAULT_HANDLE_POS_Y_DIFF
	handle_s.rotation_degrees = Global.VAULT_HANDLE_OPEN_ROT
	handle_s.shape.radius = Global.VAULT_HANDLE_OPEN_RAD
	#handle_s.scale.x = Global.VAULT_HANDLE_OPEN_SCALE_X
	#handle_s.scale.y = Global.VAULT_HANDLE_OPEN_SCALE_Y
	#handle_s.skew = Global.VAULT_HANDLE_OPEN_SKEW

func close_vault():
	vault_s.set_texture(vault_closed_t)
	handle_s.position.x += Global.VAULT_HANDLE_POS_X_DIFF
	handle_s.position.y += Global.VAULT_HANDLE_POS_Y_DIFF
	handle_s.rotation_degrees = Global.VAULT_HANDLE_CLOSED_ROT
	handle_s.shape.radius = Global.VAULT_HANDLE_CLOSED_RAD
	#handle_s.scale.x = Global.VAULT_HANDLE_CLOSED_SCALE_X
	#handle_s.scale.y = Global.VAULT_HANDLE_CLOSED_SCALE_Y
	#handle_s.skew = Global.VAULT_HANDLE_CLOSED_SKEW
