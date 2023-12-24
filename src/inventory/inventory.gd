extends Control

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
	print(item_name)
	var textureRect = TextureRect.new()
	textureRect.texture = items_t[item_name]
	textureRect.expand_mode = TextureRect.EXPAND_FIT_HEIGHT_PROPORTIONAL
	textureRect.stretch_mode = TextureRect.STRETCH_SCALE
	$InventoryContainer.add_child(textureRect)
	$InventoryContainer.move_child(textureRect, $InventoryContainer.get_child_count() - 2)
