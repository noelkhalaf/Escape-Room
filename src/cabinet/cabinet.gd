extends Area2D

var cabinet_closed_t = preload("res://assets/images/cabinet.png")
var cabinet_open_t = preload("res://assets/images/cabinet-open.png")

@onready var cabinet_s = $CabinetImage
@onready var drawer_s = $Drawer

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
		if cabinet_s.get_texture() == cabinet_closed_t:
			open_drawer()
		else:
			close_drawer()

func open_drawer():
	cabinet_s.set_texture(cabinet_open_t)
	drawer_s.position.x = Global.DRAWER_OPEN_POS_X
	drawer_s.position.y = Global.DRAWER_OPEN_POS_Y

func close_drawer():
	cabinet_s.set_texture(cabinet_closed_t)
	drawer_s.position.x = Global.DRAWER_CLOSED_POS_X
	drawer_s.position.y = Global.DRAWER_CLOSED_POS_Y
