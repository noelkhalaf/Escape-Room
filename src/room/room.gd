extends Node2D

@onready var inventory_sc = $inventory

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func obtained_key():
	inventory_sc.add_item("key")
	
func obtained_notepad():
	inventory_sc.add_item("notepad")
