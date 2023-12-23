extends Node2D

const items_t = {"key" : preload(Global.KEY_0_T),
				"notepad" : preload(Global.NOTEPAD_0_T)}

var inventory: Array = []

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func add_item(item_name):
	inventory.append(item_name)
	#var item_display = TextureRect.new()
	#item_display.texture = items_t[item_name]
	#$InventoryContainer.add_child(item_display)
	update_inventory_ui()

func update_inventory_ui():
	for i in range(inventory.size()):
		var item_name = inventory[i]
		var item_texture = items_t[item_name]
		var item_display = $InventoryContainer.get_child(i)
		item_display.texture = item_texture
