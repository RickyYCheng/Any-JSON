## Provides common functions for all A2J systems to use.
class_name A2JUtil extends RefCounted


## Returns true if the array consists of only numbers (int or float).
static func is_number_array(array:Array) -> bool:
	return array.all(func(item) -> bool:
		return item is int or item is float
	)


## Returns the global class name of the [param object].
static func get_object_class(object:Object) -> String:
	var object_class: String
	var script = object.get_script()
	if script is Script:
		# Search for class in `A2J.object_registry`.
		var object_class_in_registry = A2J.object_registry.find_key(object.get_script())
		if object_class_in_registry is StringName: object_class = object_class_in_registry

		else: object_class = object.get_class()
	else: object_class = object.get_class()

	return object_class
