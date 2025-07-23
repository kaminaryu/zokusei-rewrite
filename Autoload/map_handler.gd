extends Node

var active_map_path: String = "res://Maps/one.tscn"
var active_map_node: Node = null
var map_paths: Dictionary
var current_room_coords := Vector2(0, 0)
var disabled := false

func init_paths(mp) :
    map_paths = mp

func shift_current_room(x_shift: int, y_shift: int) :
    if disabled :
        print("Node is disabled")
        return
        
    if active_map_node :
        active_map_node.queue_free()
    
    #print("Changing room with shift: ", x_shift, " ", y_shift)
    current_room_coords += Vector2(x_shift, y_shift)
    
    var map = load(map_paths[current_room_coords]).instantiate()
    get_tree().root.get_node("/root/MainNode/Environment").add_child(map)
    
    active_map_node = map
    print(x_shift, " ", y_shift)
    if !(x_shift == 0 and y_shift == 0) :
        print("its now diasbled")
        disabled = true
        await get_tree().create_timer(0.5).timeout # ts will be replaced by a transition anim anyway lol....................................................
        disabled = false
        print("enabled again lol")
