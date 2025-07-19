extends Node2D

var current_node_id := 1
var active_map_path: String = "res://Maps/one.tscn"
var active_map_node: Node = null
var map_paths: Dictionary
# idk what i am doing


func _ready() :
    for node in get_children() :
        map_paths[node.map_id] = node.map_path

    # generate default map / main map
    print(map_paths)
    generate_current_node(1)
        
    
func change_node(new_node) :
    current_node_id = new_node
    
    
func generate_current_node(node_id) :
    if active_map_node :
        active_map_node.queue_free()

    var map = load(map_paths[node_id]).instantiate()
    get_tree().root.get_node("/root/MainNode/Environment").add_child(map)
    active_map_node = map

    
func get_surrounding_nodes(curr_node) :
    pass

func _input(evt) :
    if evt.is_action_pressed("change-map") :
        current_node_id += 1
        generate_current_node(current_node_id)
