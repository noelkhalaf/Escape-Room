extends Area2D

@onready var vault_s = $".."
@onready var back_s = $Back
@onready var enter_s = $Enter
@onready var clear_s = $Clear
@onready var zero_s = $Zero
@onready var one_s = $One
@onready var two_s = $Two
@onready var three_s = $Three
@onready var four_s = $Four
@onready var five_s = $Five
@onready var six_s = $Six
#@onready var seven_s = $Seven
#@onready var eight_s = $Eight
#@onready var nine_s = $Nine

const correct_passcode: String = "3206"
var user_passcode: String = ""

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
			2:
				clear_user_passcode()
			_:
				number_clicked(shape_idx - 3)

func back_clicked():
	self.visible = false

func enter_clicked():
	if user_passcode == correct_passcode:
		vault_s.unlock_vault()
	else:
		clear_user_passcode()

func clear_user_passcode():
	user_passcode = ""

func number_clicked(number):
	user_passcode = user_passcode + str(number)
