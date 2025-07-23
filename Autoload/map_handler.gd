extends Node

var active_map_path: String = "res://Maps/one.tscn"
var active_map_node: Node = null
var map_paths: Dictionary
var current_room_coords := Vector2(0, 0)


func init_paths(mp) :
    map_paths = mp

func shift_current_room(x_shift: int, y_shift: int) :
    if active_map_node :
        active_map_node.queue_free()
    
    current_room_coords += Vector2(x_shift, y_shift)
    var map = load(map_paths[current_room_coords]).instantiate()
    get_tree().root.get_node("/root/MainNode/Environment").add_child(map)
    active_map_node = map
