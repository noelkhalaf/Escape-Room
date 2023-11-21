extends Area2D

@onready var back_s = $Back
@onready var vault_s = $".."

# Called when the node enters the scene tree for the first time.
func ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
		match shape_idx:
			0:
				back_clicked()
			1:
				enter_clicked()

func back_clicked():
	self.visible = false

func enter_clicked():
	vault_s.unlock_vault() # TODO check if combination is correct
