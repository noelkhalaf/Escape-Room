extends Node2D

const items_t = {"key" : preload("res://assets/images/item-images/key.png"),
				"notepad" : preload("res://assets/images/item-images/notepad.png")}

var inventory: Array = []

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func add_item(item_name):
	inventory.append(item_name)
	update_inventory_ui()

func update_inventory_ui():
	for i in range(inventory.size()):
		var item_name = inventory[i]
		var item_texture = items_t[item_name]

		# Assuming you have a TextureRect in your UI to display items
		var item_display = $InventoryContainer.get_child(i)
		item_display.texture = item_texture
