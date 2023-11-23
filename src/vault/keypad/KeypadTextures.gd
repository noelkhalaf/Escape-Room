extends TextureRect

const default_t = preload("res://assets/images/vault-keypad/keypad-default.png")
const accept_t = preload("res://assets/images/vault-keypad/accept.png")
const clear_t = preload("res://assets/images/vault-keypad/reset.png")
const zero_t = preload("res://assets/images/vault-keypad/0.png")
const one_t = preload("res://assets/images/vault-keypad/1.png")
const two_t = preload("res://assets/images/vault-keypad/2.png")
const three_t = preload("res://assets/images/vault-keypad/3.png")
const four_t = preload("res://assets/images/vault-keypad/4.png")
const five_t = preload("res://assets/images/vault-keypad/5.png")
const six_t = preload("res://assets/images/vault-keypad/6.png")
const seven_t = preload("res://assets/images/vault-keypad/7.png")
const eight_t = preload("res://assets/images/vault-keypad/8.png")
const nine_t = preload("res://assets/images/vault-keypad/9.png")

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
