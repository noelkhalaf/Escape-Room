extends VBoxContainer


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _get_drag_data(_pos):
	# Create a new TextureRect
	var drag_texture_rect = TextureRect.new()
	# Get the TextureRect that is being dragged
	var dragged_texture_rect = get_child(get_child_index_under_mouse())
	# Set the new TextureRect's texture to the dragged TextureRect's texture
	drag_texture_rect.texture = dragged_texture_rect.texture
	# Set the drag preview to the new TextureRect
	set_drag_preview(drag_texture_rect)
	# Return the dragged TextureRect
	return dragged_texture_rect

# This function is called to check whether data can be dropped into the Control node
func can_drop_data(position, data):
	# Check if the data is a TextureRect
	return data is TextureRect

# This function is called when data is dropped into the Control node
func drop_data(position, data):
	# Remove the old TextureRect
	remove_child(data)
	# Add the new TextureRect at the position it was dropped
	add_child(data, true, get_child_index_under_mouse())

func get_child_index_under_mouse():
	for i in range(get_child_count()):
		var child = get_child(i)
		if child.get_rect().has_point(child.get_local_mouse_position()):
			return i
	return -1
