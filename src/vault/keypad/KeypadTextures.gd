extends TextureRect

const default_t = preload(Global.KEYPAD_T)
const accept_t = preload(Global.KEYPAD_SOLVED_T)
const clear_t = preload(Global.KEYPAD_CLEARED_T)
const zero_t = preload(Global.KEYPAD_0_T)
const one_t = preload(Global.KEYPAD_1_T)
const two_t = preload(Global.KEYPAD_2_T)
const three_t = preload(Global.KEYPAD_3_T)
const four_t = preload(Global.KEYPAD_4_T)
const five_t = preload(Global.KEYPAD_5_T)
const six_t = preload(Global.KEYPAD_6_T)
const seven_t = preload(Global.KEYPAD_7_T)
const eight_t = preload(Global.KEYPAD_8_T)
const nine_t = preload(Global.KEYPAD_9_T)

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func default_animation():
	texture = default_t

func enter_animation():
	for i in range(4): # TODO: Not flashing default image, stuck on accept_t
		texture = accept_t
		await get_tree().create_timer(0.5).timeout
		texture = default_t
	texture = accept_t

func clear_animation():
	texture = clear_t
	await get_tree().create_timer(1).timeout
	texture = default_t

func number_animation(number):
	match number:
		0:
			texture = zero_t
		1:
			texture = one_t
		2:
			texture = two_t
		3:
			texture = three_t
		4:
			texture = four_t
		5:
			texture = five_t
		6:
			texture = six_t
		7:
			texture = seven_t
		8:
			texture = eight_t
		9:
			texture = nine_t
