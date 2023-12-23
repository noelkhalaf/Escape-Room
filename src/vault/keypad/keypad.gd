extends Area2D

const button_press_a = preload(GlobalAudios.KEYPAD_BUTTON_A)
const clear_keypad_a = preload(GlobalAudios.KEYPAD_CLEARED_A)
const solved_keypad_a = preload(GlobalAudios.KEYPAD_SOLVED_A)

@onready var vault_s = $".."
@onready var keypad_image_s = $KeypadImage
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
@onready var seven_s = $Seven
@onready var eight_s = $Eight
@onready var nine_s = $Nine
@onready var keypad_textures_s = $KeypadTextures
@onready var keypad_sounds_s = $KeypadSounds

const correct_passcode: String = "3207"
var user_passcode: String = ""
var solved: bool = false

# Called when the node enters the scene tree for the first time.
func ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		if event.pressed:
			match shape_idx:
				0:
					back_clicked()
				1:
					if !solved:
						enter_clicked()
				2:
					if !solved:
						clear_user_passcode()
				_:
					if !solved:
						number_clicked(shape_idx - 3)
		elif event.is_released() && !solved:
			match shape_idx:
				0:
					pass
				1:
					pass
				2:
					pass
				_:
					keypad_textures_s.default_animation()

func back_clicked():
	self.visible = false

func enter_clicked():
	print(user_passcode)
	if user_passcode == correct_passcode:
		solved = true
		keypad_sounds_s.stream = solved_keypad_a
		keypad_sounds_s.play()
		vault_s.unlock_vault()
		keypad_textures_s.enter_animation()
	else:
		clear_user_passcode()

func clear_user_passcode():
	user_passcode = ""
	keypad_textures_s.clear_animation()
	keypad_sounds_s.stream = clear_keypad_a
	keypad_sounds_s.play()

func number_clicked(number):
	user_passcode = user_passcode + str(number)
	keypad_textures_s.number_animation(number)
	keypad_sounds_s.stream = button_press_a
	keypad_sounds_s.play()
	
