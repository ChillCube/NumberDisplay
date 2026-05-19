@tool
extends NodeArranger
class_name NumbersUI2D

enum HAlignment { LEFT, CENTER, RIGHT }

@export var number : int:
	set(val):
		number = max(0, val)
		if number_resource and is_inside_tree():
			set_number(val)

@export var number_resource : NumberResource

@export var h_alignment : HAlignment = HAlignment.LEFT:
	set(val):
		centered = true;
		h_alignment = val
		if number_resource and is_inside_tree():
			set_number(number)

@export var spawn_offset : Vector2 = Vector2.ZERO

func _ready() -> void:
	if number_resource:
		set_number(number)

func get_digit(number: int, position: int) -> int:
	# position: 0 = ones place, 1 = tens place, 2 = hundreds place, etc.
	return (number / int(pow(10, position))) % 10

func get_number_length(number: int) -> int:
	return str(number).length();

func set_number(val : int):
	var i : int = 0
	var number_length = get_number_length(val)
	var children_left = number_length - get_child_count()
	max_horizontal = number_length
	max_vertical = 1
	match h_alignment:
		HAlignment.CENTER:
			centered = true
			offset.x = 0.0
		HAlignment.LEFT:
			centered = false
			offset.x = -distance_horizontal / 2.0
		HAlignment.RIGHT:
			centered = false
			offset.x = -distance_horizontal * (number_length + 0.5)
	var new_children: Array[Node] = []
	while i < children_left:
		var digit := DigitNumbers.new()
		add_child(digit)
		new_children.append(digit)
		i += 1
	while children_left < 0:
		var child = get_child(get_child_count() - 1)
		remove_child(child)
		child.queue_free()
		children_left += 1
	i = 0
	while i < number_length:
		var num : DigitNumbers = get_child(i)
		num.number_resource = number_resource
		num.number = get_digit(val, number_length - 1 - i)
		i += 1
	arrange()
	for child in new_children:
		var smooth_mover = has_smooth_mover(child)
		if smooth_mover:
			child.global_position = smooth_mover.global_target_position + spawn_offset
		elif child is Node2D:
			child.global_position += spawn_offset
