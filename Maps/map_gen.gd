extends Node2D

var current_node_id := 0
var map_paths : Dictionary
# idk what i am doing

# idk how to do this :(

# Each room have their own designated nodes with their path and coords imbedded
func _ready() :
    visible = false
    for node in get_children() :
        # map_paths[node.map_id] = node.map_path # idk if ID is gonna be used, leaving it be for now
        map_paths[node.position / 32] = node.map_path

    # generate default map / main map
    MapHandler.init_paths(map_paths)
