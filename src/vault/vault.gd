extends Area2D

const vault_closed_t = preload(Global.VAULT_CLOSED_LOCKED_T)
const vault_closed_unlocked_t = preload(Global.VAULT_CLOSED_UNLOCKED_T)
const vault_open_t = preload(Global.VAULT_OPEN_T)
const vault_open_key_t = preload(Global.VAULT_OPEN_W_KEY_T)
const vault_unlocking_a = preload(GlobalAudios.VAULT_UNLOCKING_A)

enum {CLOSED_W_KEY, OPEN_W_KEY, CLOSED_NO_KEY, OPEN_NO_KEY}

@onready var room_sc = $".."
@onready var vault_image_s = $VaultImage
@onready var handle_s = $Handle
@onready var key_s = $Key
@onready var keypad_s = $Keypad
@onready var keypad_sc = $keypad
@onready var vault_sounds_s = $VaultSounds

var state = CLOSED_W_KEY
var vault_unlocked: bool = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
		match shape_idx:
			0:
				handle_clicked()
			1:
				key_clicked()
			2:
				keypad_clicked()

func handle_clicked():
	match state:
		CLOSED_W_KEY:
			if vault_unlocked:
				open_vault(vault_open_key_t)
				state = OPEN_W_KEY
		OPEN_W_KEY:
			close_vault(vault_closed_unlocked_t)	
			state = CLOSED_W_KEY
		CLOSED_NO_KEY:
			open_vault(vault_open_t)
			state = OPEN_NO_KEY
		OPEN_NO_KEY:
			close_vault(vault_closed_unlocked_t)
			state = CLOSED_NO_KEY

func key_clicked():
	if state == OPEN_W_KEY: # TODO: add inventory update
		vault_image_s.set_texture(vault_open_t)
		state = OPEN_NO_KEY
		room_sc.obtained_key()

func keypad_clicked():
	if state == CLOSED_W_KEY or state == CLOSED_NO_KEY:
		keypad_sc.visible = true

func open_vault(image_t):
	vault_image_s.set_texture(image_t)
	handle_s.position.x -= Global.VAULT_HANDLE_POS_X_DIFF
	handle_s.position.y -= Global.VAULT_HANDLE_POS_Y_DIFF
	handle_s.rotation_degrees = Global.VAULT_HANDLE_OPEN_ROT
	handle_s.shape.radius = Global.VAULT_HANDLE_OPEN_RAD

func close_vault(image_t):
	vault_image_s.set_texture(image_t)
	handle_s.position.x += Global.VAULT_HANDLE_POS_X_DIFF
	handle_s.position.y += Global.VAULT_HANDLE_POS_Y_DIFF
	handle_s.rotation_degrees = Global.VAULT_HANDLE_CLOSED_ROT
	handle_s.shape.radius = Global.VAULT_HANDLE_CLOSED_RAD
	
func unlock_vault():
	vault_unlocked = true
	vault_image_s.set_texture(vault_closed_unlocked_t)
	vault_sounds_s.stream = vault_unlocking_a
	vault_sounds_s.play()
	
func lock_vault():
	vault_unlocked = false
	vault_image_s.set_texture(vault_closed_t)
