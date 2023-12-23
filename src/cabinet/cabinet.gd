extends Area2D

var cabinet_closed_t = preload(Global.CABINET_CLOSED_T)
var cabinet_open_t = preload(Global.CABINET_OPEN_T)
var cabinet_open_note_t = preload(Global.CABINET_OPEN_W_NOTEPAD_T)

@onready var room_sc = $".."
@onready var cabinet_s = $CabinetImage
@onready var drawer_s = $Drawer
@onready var note_s = $Note

enum {CLOSED_W_ITEM, OPEN_W_ITEM, CLOSED_NO_ITEM, OPEN_NO_ITEM}

var state = CLOSED_W_ITEM

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
		match shape_idx:
			0:
				note_clicked()
			1:
				drawer_clicked()

func drawer_clicked():
	match state:
		CLOSED_W_ITEM:
			open_drawer(cabinet_open_note_t)
			state = OPEN_W_ITEM
		OPEN_W_ITEM:
			close_drawer()
			state = CLOSED_W_ITEM
		CLOSED_NO_ITEM:
			open_drawer(cabinet_open_t)
			state = OPEN_NO_ITEM
		OPEN_NO_ITEM:
			close_drawer()
			state = CLOSED_NO_ITEM

func note_clicked():
	if state == OPEN_W_ITEM: # TODO: add inventory update
		cabinet_s.set_texture(cabinet_open_t)
		state = OPEN_NO_ITEM
		room_sc.obtained_notepad()

func open_drawer(image_t):
	cabinet_s.set_texture(image_t)
	drawer_s.position.x += Global.CABINET_POS_X_DIFF
	drawer_s.position.y += Global.CABINET_POS_Y_DIFF

func close_drawer():
	cabinet_s.set_texture(cabinet_closed_t)
	drawer_s.position.x -= Global.CABINET_POS_X_DIFF
	drawer_s.position.y -= Global.CABINET_POS_Y_DIFF
