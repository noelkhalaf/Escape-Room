extends Area2D

var vault_closed_t = preload("res://assets/images/vault.png")
var vault_open_t = preload("res://assets/images/vault-open.png")

@onready var vault_s = $VaultImage

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
		if vault_s.get_texture() == vault_closed_t:
			vault_s.set_texture(vault_open_t)
		else:
			vault_s.set_texture(vault_closed_t)
