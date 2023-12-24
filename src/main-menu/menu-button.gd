extends Button

var tween: Tween

@onready var line_control = $"../LineControl"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# ***Could I avoid having a separate script by adding if statements here?***
func hover_on() -> void:
	if tween and tween.is_running():
		tween.kill()
	tween = create_tween().set_ease(Tween.EASE_OUT).set_trans(Tween.TRANS_CUBIC)
	for c in line_control.get_children():
		tween.tween_property(c, "scale:x", 1.0, 0.3)

func hover_off() -> void:
	if tween and tween.is_running():
		tween.kill()
	tween = create_tween().set_ease(Tween.EASE_OUT).set_trans(Tween.TRANS_CUBIC)
	for c in line_control.get_children():
		tween.tween_property(c, "scale:x", 0.0, 0.5)


func _on_mouse_entered():
	hover_on()
	pass # Replace with function body.


func _on_mouse_exited():
	hover_off()
	pass # Replace with function body.

func _on_pressed():
	get_tree().quit()
