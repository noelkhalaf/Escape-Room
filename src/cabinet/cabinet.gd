extends Area2D

var cabinet_closed_t = preload("res://assets/images/cabinet.png")
var cabinet_open_t = preload("res://assets/images/cabinet-open.png")

@onready var cabinet_s = $CabinetImage

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
		if cabinet_s.get_texture() == cabinet_closed_t:
			cabinet_s.set_texture(cabinet_open_t)
		else:
			cabinet_s.set_texture(cabinet_closed_t)
		
